#include <ros/ros.h>
#include <ros/package.h>
#include <std_msgs/String.h>
#define _USE_MATH_DEFINES
#include <math.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <std_msgs/Bool.h>
#include <points_msgs/points_density.h>
#include <points_msgs/points_density_array.h>
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
ros::Publisher _pub_segmented_cloud;
ros::Publisher _pub_projected_cloud;
ros::Publisher _pub_points_density;

static const double _segment_number = 10;

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
  float distance = 6.5;
  float in_left_lane_threshold = 5;
  float in_right_lane_threshold = -6;
  float in_top_lane_threshold = 40;
  float in_bottom_lane_threshold = -5;

  for(unsigned int i=0; i< in_cloud_ptr->points.size(); i++)
  {
    pcl::PointXYZ current_point;
    current_point.x=in_cloud_ptr->points[i].x;
    current_point.y=in_cloud_ptr->points[i].y;
    current_point.z=in_cloud_ptr->points[i].z;
    // cout<<-2.0*current_point.x +1.0*current_point.y;

    if (
      // sqrt( pow(current_point.x,2) + pow(current_point.y, 2) + pow(current_point.z, 2)) > distance
      1.0*current_point.x +0.65*current_point.y < (in_left_lane_threshold) && 1.0*current_point.x  +0.65*current_point.y > 1.0*in_right_lane_threshold
      && sqrt( pow(current_point.x,2) + pow(current_point.y, 2) + pow(current_point.z, 2)) < 30
      && -0.65*current_point.x +1.0*current_point.y < (in_top_lane_threshold) && -0.65*current_point.x  +1.0*current_point.y > 1.0*in_bottom_lane_threshold
        )
    {
      far_indices->indices.push_back(i);
    }
  }
  out_cloud_ptr->points.clear();
  pcl::ExtractIndices<pcl::PointXYZI> extract;
  extract.setInputCloud (in_cloud_ptr);
  extract.setIndices(far_indices);
  extract.setNegative(false);//true removes the indices, false leaves only the indices
  extract.filter(*out_cloud_ptr);
}


void p_density(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_ptr)
{
  int tmp = 0;
  int bar = 40;
  int points_num[bar] = {0};

  double dist [in_cloud_ptr->points.size()+1];
  double dist_num [bar] = {0};
  double points_int[bar] = {0};
  double max_dist;

  points_msgs::points_density_array msg_array;

  for(unsigned int i=0; i< in_cloud_ptr->points.size(); i++)
  {
    pcl::PointXYZ current_point;
    current_point.x=in_cloud_ptr->points[i].x;
    current_point.y=in_cloud_ptr->points[i].y;
    current_point.z=in_cloud_ptr->points[i].z;

    dist[i] = sqrt( pow(current_point.x,2) + pow(current_point.y, 2) + pow(current_point.z, 2));
  }

   max_dist = *max_element(dist , dist+in_cloud_ptr->points.size()+1);

   for(unsigned int m=0; m< in_cloud_ptr->points.size(); m++)
  {
    for(int n=0; n< bar; n++)
    {
      if(double(max_dist/bar*n) < dist[m] && dist[m] <= double(max_dist/bar*(n+1)))
      {
        points_num[n]+=1;
        points_int[n]+=in_cloud_ptr->points[m].intensity;
      }
      
    }
  }

   for(int k=0; k<bar; k++)
   {
    points_msgs::points_density msg;
    msg.points_num = points_num[k];
    if(points_num[k] != 0)
      msg.points_int = (points_int[k]/points_num[k]);
    else
      msg.points_int = 0;
    msg.dist_num = double(max_dist/bar*k);

    msg_array.points_density_array.push_back(msg);
   }

   // cout<<msg_array<<endl;

   _pub_points_density.publish(msg_array);
}


void velodyne_callback(const sensor_msgs::PointCloud2ConstPtr& in_sensor_cloud)
{
  
    pcl::PointCloud<pcl::PointXYZI>::Ptr current_sensor_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr clipped_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);
    _velodyne_header = in_sensor_cloud->header;

    pcl::fromROSMsg(*in_sensor_cloud, *current_sensor_cloud_ptr);

    clipCloud(current_sensor_cloud_ptr, clipped_cloud_ptr);
    publishCloud(&_pub_clipped_cloud, clipped_cloud_ptr);

    p_density(clipped_cloud_ptr);

  

}


int main(int argc, char **argv)
{

  ros::init(argc, argv, "curb_based_segmentation");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe ("/points_raw", 1, velodyne_callback);

  // _pub_segmented_cloud = nh.advertise<sensor_msgs::PointCloud2>("/segmented_points",1);
  _pub_clipped_cloud = nh.advertise<sensor_msgs::PointCloud2>("/clipped_points",1);
  _pub_points_density = nh.advertise<points_msgs::points_density_array>("/points_density_array",1);
 
  ros::spin ();
}