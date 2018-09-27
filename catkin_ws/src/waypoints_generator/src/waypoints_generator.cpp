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
ros::Publisher _pub_left_cloud;
ros::Publisher _pub_right_cloud;
ros::Publisher _pub_mid_cloud;



using namespace std;

void g_waypoints(const pcl::PointCloud<pcl::PointXYZI>::Ptr a_cloud, const pcl::ModelCoefficients::Ptr a_coefficients,
                 const pcl::PointCloud<pcl::PointXYZI>::Ptr b_cloud, const pcl::ModelCoefficients::Ptr b_coefficients,
                 pcl::PointCloud<pcl::PointXYZI>::Ptr out_cloud_ptr)
{

  pcl::PointCloud<pcl::PointXYZI>::Ptr projected_cloud (new pcl::PointCloud<pcl::PointXYZI>);
  pcl::PointCloud<pcl::PointXYZI>::Ptr temp_cloud (new pcl::PointCloud<pcl::PointXYZI>);

  pcl::ProjectInliers<pcl::PointXYZI> a_proj;
  a_proj.setModelType (pcl::SACMODEL_LINE);
  a_proj.setInputCloud (a_cloud);
  a_proj.setModelCoefficients (b_coefficients);
  a_proj.filter (*projected_cloud);


  pcl::ProjectInliers<pcl::PointXYZI> b_proj;
  b_proj.setModelType (pcl::SACMODEL_LINE);
  b_proj.setInputCloud (b_cloud);
  b_proj.setModelCoefficients (a_coefficients);
  b_proj.filter (*temp_cloud);


  for (size_t i = 0; i < projected_cloud->points.size (); ++i)
   {
    pcl::PointXYZI current_point;
    current_point.x = (a_cloud->points[i].x + projected_cloud->points[i].x)/2;
    current_point.y = (a_cloud->points[i].y + projected_cloud->points[i].y)/2;
    current_point.z = (a_cloud->points[i].z + projected_cloud->points[i].z)/2;
    out_cloud_ptr->points.push_back(current_point);
   }

   for (size_t i = 0; i < temp_cloud->points.size (); ++i)
   {
    pcl::PointXYZI nor_point;
    nor_point.x = (b_cloud->points[i].x + temp_cloud->points[i].x)/2;
    nor_point.y = (b_cloud->points[i].y + temp_cloud->points[i].y)/2;
    nor_point.z = (b_cloud->points[i].z + temp_cloud->points[i].z)/2;
    out_cloud_ptr->points.push_back(nor_point);
   }

}

void segLine(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_ptr, pcl::PointCloud<pcl::PointXYZI>::Ptr out_cloud_ptr,
             pcl::ModelCoefficients::Ptr out_coefficients, pcl::PointCloud<pcl::PointXYZI>::Ptr remain_cloud_ptr)
{
  pcl::PointCloud<pcl::PointXYZI>::Ptr segmented_cloud (new pcl::PointCloud<pcl::PointXYZI>);
  pcl::SACSegmentation<pcl::PointXYZI> seg;
  pcl::PointIndices::Ptr inliers(new pcl::PointIndices);
  pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);


  seg.setOptimizeCoefficients(true);
  seg.setModelType(pcl::SACMODEL_LINE);
  seg.setMethodType(pcl::SAC_RANSAC);
  seg.setMaxIterations(10);
  
  seg.setDistanceThreshold(0.1);  // floor distance
  seg.setOptimizeCoefficients(true);
  seg.setInputCloud(in_cloud_ptr);
  seg.segment(*inliers, *coefficients);
  if (inliers->indices.size() == 0)
  {
    std::cout << "Could not estimate a LINE model for the given dataset." << std::endl;
  }


  pcl::ExtractIndices<pcl::PointXYZI> extract;
  extract.setInputCloud (in_cloud_ptr);
  extract.setIndices(inliers);
  extract.setNegative(false);//true removes the indices, false leaves only the indices
  extract.filter(*segmented_cloud);
  extract.setNegative(true);//true removes the indices, false leaves only the indices
  extract.filter(*remain_cloud_ptr);
  
  out_coefficients->values.resize(coefficients->values.size());
  for (size_t i = 0; i < coefficients->values.size(); ++i)
    {
      out_coefficients->values[i] = coefficients->values[i];
    }

  pcl::ProjectInliers<pcl::PointXYZI> proj;
  proj.setModelType (pcl::SACMODEL_LINE);
  proj.setInputCloud (segmented_cloud);
  proj.setModelCoefficients (coefficients);
  proj.filter (*out_cloud_ptr);

  // for (size_t i = 0; i < out_cloud_ptr->points.size(); ++i)
  //   {
  //     std::cout <<out_cloud_ptr->points[i].x;
  //   }


}

void publishCloud(const ros::Publisher* in_publisher, const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_to_publish_ptr)
{

  sensor_msgs::PointCloud2 cloud_msg;
  pcl::toROSMsg(*in_cloud_to_publish_ptr, cloud_msg);
  cloud_msg.header=_velodyne_header;
  in_publisher->publish(cloud_msg);
}



void velodyne_callback(const sensor_msgs::PointCloud2ConstPtr& in_sensor_cloud)
{
  
  pcl::PointCloud<pcl::PointXYZI>::Ptr current_sensor_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);
  pcl::PointCloud<pcl::PointXYZI>::Ptr mid_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);

  pcl::PointCloud<pcl::PointXYZI>::Ptr a_cloud (new pcl::PointCloud<pcl::PointXYZI>);
  pcl::ModelCoefficients::Ptr a_coefficients(new pcl::ModelCoefficients);

  pcl::PointCloud<pcl::PointXYZI>::Ptr filtered_cloud (new pcl::PointCloud<pcl::PointXYZI>);
  pcl::PointCloud<pcl::PointXYZI>::Ptr outlier_cloud (new pcl::PointCloud<pcl::PointXYZI>);

  pcl::PointCloud<pcl::PointXYZI>::Ptr b_cloud (new pcl::PointCloud<pcl::PointXYZI>);
  pcl::ModelCoefficients::Ptr b_coefficients(new pcl::ModelCoefficients);
  pcl::PointCloud<pcl::PointXYZI>::Ptr project_cloud (new pcl::PointCloud<pcl::PointXYZI>);
 

  _velodyne_header = in_sensor_cloud->header;

  pcl::fromROSMsg(*in_sensor_cloud, *current_sensor_cloud_ptr);


  segLine(current_sensor_cloud_ptr, a_cloud, a_coefficients, filtered_cloud);
  segLine(filtered_cloud, b_cloud, b_coefficients, outlier_cloud);

  
  g_waypoints(a_cloud, a_coefficients, b_cloud, b_coefficients, mid_cloud_ptr);

  publishCloud(&_pub_left_cloud,a_cloud);
  publishCloud(&_pub_right_cloud,b_cloud);
  publishCloud(&_pub_mid_cloud, mid_cloud_ptr);

}


int main(int argc, char **argv)
{

  ros::init(argc, argv, "ground_segmentation");
  ros::NodeHandle nh;

  ros::Subscriber sub = nh.subscribe ("/points_raw", 1, velodyne_callback);

  
  _pub_left_cloud = nh.advertise<sensor_msgs::PointCloud2>("/left_points",1);
  _pub_right_cloud = nh.advertise<sensor_msgs::PointCloud2>("/right_points",1);
  _pub_mid_cloud = nh.advertise<sensor_msgs::PointCloud2>("/mid_points",1);

  ros::spin ();
}