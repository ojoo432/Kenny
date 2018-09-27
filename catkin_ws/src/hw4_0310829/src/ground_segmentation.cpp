#include <ros/ros.h>
#include <ros/package.h>
#include <std_msgs/String.h>
#define _USE_MATH_DEFINES
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
ros::Publisher _pub_segmented_cloud;
ros::Publisher _pub_projected_cloud;

static const double _segment_number = 10;

using namespace std;

void publishCloud(const ros::Publisher* in_publisher, const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_to_publish_ptr)
{
  sensor_msgs::PointCloud2 cloud_msg;
  pcl::toROSMsg(*in_cloud_to_publish_ptr, cloud_msg);
  cloud_msg.header=_velodyne_header;
  in_publisher->publish(cloud_msg);
}


void segCloud(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_ptr,
          pcl::PointCloud<pcl::PointXYZI>::Ptr out_cloud_ptr)
{
  pcl::PointIndices::Ptr far_indices (new pcl::PointIndices);

  for(unsigned int i=0; i< in_cloud_ptr->points.size(); i++)
  {
    pcl::PointXYZ current_point;
    current_point.x=in_cloud_ptr->points[i].x;
    current_point.y=in_cloud_ptr->points[i].y;
    current_point.z=in_cloud_ptr->points[i].z;

    double angle = atan2(current_point.y,current_point.x);

    if (
        angle >M_PI*4/_segment_number && angle<M_PI*5/_segment_number
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


void velodyne_callback(const sensor_msgs::PointCloud2ConstPtr& in_sensor_cloud)
{
  
    pcl::PointCloud<pcl::PointXYZI>::Ptr current_sensor_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr segmented_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);
    _velodyne_header = in_sensor_cloud->header;

    pcl::fromROSMsg(*in_sensor_cloud, *current_sensor_cloud_ptr);

    segCloud(current_sensor_cloud_ptr, segmented_cloud_ptr);

    publishCloud(&_pub_segmented_cloud, segmented_cloud_ptr);


}


int main(int argc, char **argv)
{

  ros::init(argc, argv, "curb_based_segmentation");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe ("/points_raw", 1, velodyne_callback);

  _pub_segmented_cloud = nh.advertise<sensor_msgs::PointCloud2>("/segmented_points",1);
 
  ros::spin ();
}