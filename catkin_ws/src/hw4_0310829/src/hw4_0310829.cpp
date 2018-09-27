#include <ros/ros.h>
#include <ros/package.h>
#include <std_msgs/String.h>
#include <math.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <std_msgs/Bool.h>
#include <iostream>
#include <ros/ros.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/PCLPointCloud2.h>
#include <pcl/conversions.h>
#include <pcl_ros/transforms.h>
#include <pcl_ros/point_cloud.h>

#include <pcl/ModelCoefficients.h>
#include <pcl/point_types.h>

#include <pcl/filters/extract_indices.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/conditional_removal.h>
#include <pcl/filters/project_inliers.h>

#include <pcl/features/normal_3d.h>
#include <pcl/features/normal_3d_omp.h>
#include <pcl/features/don.h>
#include <pcl/features/fpfh_omp.h>

#include <pcl/kdtree/kdtree.h>

#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>

#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/segmentation/extract_clusters.h>
#include <pcl/segmentation/conditional_euclidean_clustering.h>

#include <pcl/common/common.h>

#include <pcl/search/organized.h>
#include <pcl/search/kdtree.h>


std_msgs::Header _velodyne_header;
ros::Publisher _pub_clipped_cloud;
ros::Publisher _pub_projected_cloud;
ros::Publisher _pub_sorted_cloud;

using namespace std;

void publishCloud(const ros::Publisher* in_publisher, const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_to_publish_ptr)
{
  sensor_msgs::PointCloud2 cloud_msg;
  pcl::toROSMsg(*in_cloud_to_publish_ptr, cloud_msg);
  cloud_msg.header=_velodyne_header;
  in_publisher->publish(cloud_msg);
}


void clipCloud(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_ptr,
          pcl::PointCloud<pcl::PointXYZI>::Ptr out_cloud_ptr)
{
  pcl::PointIndices::Ptr far_indices (new pcl::PointIndices);
  float in_left_lane_threshold = 11.5;
  float in_right_lane_threshold = 9.5;

  for(unsigned int i=0; i< in_cloud_ptr->points.size(); i++)
  {
    pcl::PointXYZ current_point;
    current_point.x=in_cloud_ptr->points[i].x;
    current_point.y=in_cloud_ptr->points[i].y;
    current_point.z=in_cloud_ptr->points[i].z;

    if (
        -1.0*current_point.x + 1.6*current_point.y > (in_left_lane_threshold) || -1.0*current_point.x + 1.6*current_point.y < 1.0*in_right_lane_threshold
      )
    {
      far_indices->indices.push_back(i);
    }
  }
  out_cloud_ptr->points.clear();
  pcl::ExtractIndices<pcl::PointXYZI> extract;
  extract.setInputCloud (in_cloud_ptr);
  extract.setIndices(far_indices);
  extract.setNegative(true);//true removes the indices, false leaves only the indices
  extract.filter(*out_cloud_ptr);
}

void projectCloud(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_ptr,
          pcl::PointCloud<pcl::PointXYZI>::Ptr out_cloud_ptr)
{
  // Create a set of planar coefficients with X=Y=0,Z=1
  pcl::ModelCoefficients::Ptr coefficients (new pcl::ModelCoefficients ());
  coefficients->values.resize (4);
  coefficients->values[0] = -1.0;
  coefficients->values[1] = 1.6;
  coefficients->values[2] = 0.0;
  coefficients->values[3] = -5.75;

  pcl::ProjectInliers<pcl::PointXYZI> proj;
  proj.setModelType (pcl::SACMODEL_PLANE);
  proj.setInputCloud (in_cloud_ptr);
  proj.setModelCoefficients (coefficients);
  proj.filter (*out_cloud_ptr);
}

void sortCloud(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_ptr,
          pcl::PointCloud<pcl::PointXYZI>::Ptr out_cloud_ptr)
{
  pcl::PointIndices::Ptr far_indices (new pcl::PointIndices);
  double dist [in_cloud_ptr->points.size()+1];
  double tmp;

  for(unsigned int i=0; i< in_cloud_ptr->points.size(); i++)
  {
    dist[i] = in_cloud_ptr->points[i].x*1.6+in_cloud_ptr->points[i].y;
  }

   for(unsigned int m=0; m< in_cloud_ptr->points.size(); m++)
   {
     for(unsigned int n=0; n<in_cloud_ptr->points.size()-m; n++)
     {
       if(dist[n]>dist[n+1])
       {
         tmp = dist[n];
         dist[n] = dist[n+1];
         dist[n+1] = tmp;
       }
     }
   }

     for(unsigned int i=0; i< in_cloud_ptr->points.size(); i++)
  {
    for(unsigned int j=0; j<in_cloud_ptr->points.size(); j++)
    {
      if(dist[i] == in_cloud_ptr->points[j].x*1.6+in_cloud_ptr->points[j].y)
        out_cloud_ptr->points.push_back(in_cloud_ptr->points[j]);
    }
  }

}

void check(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_ptr)
{
   for(unsigned int i=0; i< in_cloud_ptr->points.size(); i++)
  {
    if(in_cloud_ptr->points[i].x*1.6+in_cloud_ptr->points[i].y<in_cloud_ptr->points[i+1].x*1.6+in_cloud_ptr->points[i+1].y)
      std::cout<<"yes";
    else
      std::cout<<"no";
  }
}

void velodyne_callback(const sensor_msgs::PointCloud2ConstPtr& in_sensor_cloud)
{
  
    pcl::PointCloud<pcl::PointXYZI>::Ptr current_sensor_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr clipped_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr projected_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr sorted_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);
    _velodyne_header = in_sensor_cloud->header;

    pcl::fromROSMsg(*in_sensor_cloud, *current_sensor_cloud_ptr);

    clipCloud(current_sensor_cloud_ptr, clipped_cloud_ptr);

    publishCloud(&_pub_clipped_cloud, clipped_cloud_ptr);

    projectCloud(clipped_cloud_ptr, projected_cloud_ptr);

    publishCloud(&_pub_projected_cloud, projected_cloud_ptr);

    sortCloud(projected_cloud_ptr, sorted_cloud_ptr);

    publishCloud(&_pub_sorted_cloud, sorted_cloud_ptr);


}


int main(int argc, char **argv)
{

  ros::init(argc, argv, "curb_based_segmentation");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe ("/points_raw", 1, velodyne_callback);

  _pub_clipped_cloud = nh.advertise<sensor_msgs::PointCloud2>("/clipped_points",1);
  _pub_projected_cloud = nh.advertise<sensor_msgs::PointCloud2>("/projected_points",1);
  _pub_sorted_cloud = nh.advertise<sensor_msgs::PointCloud2>("/sorted_points",1);
 
  ros::spin ();
}