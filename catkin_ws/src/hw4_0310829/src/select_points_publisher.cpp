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

ofstream outfile;
outfile.open("/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/point_cloud.csv")


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


void clipCloud(const pcl::PointCloud<pcl::PointXYZ>::Ptr in_cloud_ptr)
{
  
  for(unsigned int i=0; i< in_cloud_ptr->points.size(); i++)
  {
    outfile <<in_cloud_ptr->points[i];
  }
}



void select_callback(const sensor_msgs::PointCloud2ConstPtr& in_sensor_cloud)
{
  
    pcl::PointCloud<pcl::PointXYZ>::Ptr current_sensor_cloud_ptr (new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr clipped_cloud_ptr (new pcl::PointCloud<pcl::PointXYZ>);
    
    _velodyne_header = in_sensor_cloud->header;

    pcl::fromROSMsg(*in_sensor_cloud, *current_sensor_cloud_ptr);

    clipCloud(current_sensor_cloud_ptr);



}


int main(int argc, char **argv)
{

  ros::init(argc, argv, "selected_points_publisher");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe ("/selected_pointcloud", 1, select_callback);

  ros::spin ();
}