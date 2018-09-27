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
#include <vector>
#include <pcl/conversions.h>
#include <pcl_ros/transforms.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/io/pcd_io.h>

#include <pcl/point_types.h>
#include <pcl/features/moment_of_inertia_estimation.h>


std::ofstream outfile("/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/point_cloud.csv");

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


void compute_bounding(const pcl::PointCloud<pcl::PointXYZ>::Ptr in_cloud_ptr)
{
  pcl::MomentOfInertiaEstimation <pcl::PointXYZ> feature_extractor;
  feature_extractor.setInputCloud (in_cloud_ptr);
  feature_extractor.compute ();

  std::vector <float> moment_of_inertia;
  std::vector <float> eccentricity;
  pcl::PointXYZ min_point_AABB;
  pcl::PointXYZ max_point_AABB;
  pcl::PointXYZ min_point_OBB;
  pcl::PointXYZ max_point_OBB;
  pcl::PointXYZ position_OBB;
  Eigen::Matrix3f rotational_matrix_OBB;
  float major_value, middle_value, minor_value;
  Eigen::Vector3f major_vector, middle_vector, minor_vector;
  Eigen::Vector3f mass_center;

  feature_extractor.getMomentOfInertia (moment_of_inertia);
  feature_extractor.getEccentricity (eccentricity);
  feature_extractor.getAABB (min_point_AABB, max_point_AABB);
  feature_extractor.getOBB (min_point_OBB, max_point_OBB, position_OBB, rotational_matrix_OBB);
  feature_extractor.getEigenValues (major_value, middle_value, minor_value);
  feature_extractor.getEigenVectors (major_vector, middle_vector, minor_vector);
  feature_extractor.getMassCenter (mass_center);


  Eigen::Vector3f position (position_OBB.x, position_OBB.y, position_OBB.z);
  Eigen::Quaternionf quat (rotational_matrix_OBB);
  

  pcl::PointXYZ center (mass_center (0), mass_center (1), mass_center (2));
  pcl::PointXYZ x_axis (major_vector (0) + mass_center (0), major_vector (1) + mass_center (1), major_vector (2) + mass_center (2));
  pcl::PointXYZ y_axis (middle_vector (0) + mass_center (0), middle_vector (1) + mass_center (1), middle_vector (2) + mass_center (2));
  pcl::PointXYZ z_axis (minor_vector (0) + mass_center (0), minor_vector (1) + mass_center (1), minor_vector (2) + mass_center (2));
  

  Eigen::Vector3f p1 (min_point_OBB.x, min_point_OBB.y, min_point_OBB.z);
  Eigen::Vector3f p2 (min_point_OBB.x, min_point_OBB.y, max_point_OBB.z);
  Eigen::Vector3f p3 (max_point_OBB.x, min_point_OBB.y, max_point_OBB.z);
  Eigen::Vector3f p4 (max_point_OBB.x, min_point_OBB.y, min_point_OBB.z);
  Eigen::Vector3f p5 (min_point_OBB.x, max_point_OBB.y, min_point_OBB.z);
  Eigen::Vector3f p6 (min_point_OBB.x, max_point_OBB.y, max_point_OBB.z);
  Eigen::Vector3f p7 (max_point_OBB.x, max_point_OBB.y, max_point_OBB.z);
  Eigen::Vector3f p8 (max_point_OBB.x, max_point_OBB.y, min_point_OBB.z);

  p1 = rotational_matrix_OBB * p1 + position;
  p2 = rotational_matrix_OBB * p2 + position;
  p3 = rotational_matrix_OBB * p3 + position;
  p4 = rotational_matrix_OBB * p4 + position;
  p5 = rotational_matrix_OBB * p5 + position;
  p6 = rotational_matrix_OBB * p6 + position;
  p7 = rotational_matrix_OBB * p7 + position;
  p8 = rotational_matrix_OBB * p8 + position;

  pcl::PointXYZ pt1 (p1 (0), p1 (1), p1 (2));
  pcl::PointXYZ pt2 (p2 (0), p2 (1), p2 (2));
  pcl::PointXYZ pt3 (p3 (0), p3 (1), p3 (2));
  pcl::PointXYZ pt4 (p4 (0), p4 (1), p4 (2));
  pcl::PointXYZ pt5 (p5 (0), p5 (1), p5 (2));
  pcl::PointXYZ pt6 (p6 (0), p6 (1), p6 (2));
  pcl::PointXYZ pt7 (p7 (0), p7 (1), p7 (2));
  pcl::PointXYZ pt8 (p8 (0), p8 (1), p8 (2));

  std::cout<<pt1<<std::endl<<pt2<<std::endl
           <<pt3<<std::endl<<pt4<<std::endl
           <<pt5<<std::endl<<pt6<<std::endl
           <<pt7<<std::endl<<pt8<<std::endl;

}



void select_callback(const sensor_msgs::PointCloud2ConstPtr& in_sensor_cloud)
{
  
    pcl::PointCloud<pcl::PointXYZ>::Ptr current_sensor_cloud_ptr (new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr clipped_cloud_ptr (new pcl::PointCloud<pcl::PointXYZ>);
    
    _velodyne_header = in_sensor_cloud->header;

    pcl::fromROSMsg(*in_sensor_cloud, *current_sensor_cloud_ptr);

    compute_bounding(current_sensor_cloud_ptr);


}


int main(int argc, char **argv)
{

  ros::init(argc, argv, "selected_points_publisher");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe ("/selected_pointcloud", 1, select_callback);

  ros::spin ();
}