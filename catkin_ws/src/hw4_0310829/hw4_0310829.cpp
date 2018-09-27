#include <ros/ros.h>
#include <ros/package.h>
#include <std_msgs/String.h>
#include <Eigen/Dense>
#include <Eigen/Geometry>
#include <math.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/transforms.h>
#include <std_msgs/Bool.h>
#include <tf/transform_broadcaster.h>
#include <iostream>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/registration/icp.h>

using namespace Eigen;


int main(int argc, char **argv)
{

  ros::init(argc, argv, "scan_matching");
  
  ros::NodeHandle nh;
  ros::Rate r(1000);

  ros::Publisher map_pub = nh.advertise<sensor_msgs::PointCloud2>("/map",1);
  ros::Publisher scene_pub = nh.advertise<sensor_msgs::PointCloud2>("/scene",1);
  ros::Publisher transform_pub = nh.advertise<sensor_msgs::PointCloud2>("/transform",1);

  pcl::PointCloud<pcl::PointXYZ>::Ptr map (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr scene (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr transformed_cloud (new pcl::PointCloud<pcl::PointXYZ>);

  std::string path = ros::package::getPath("hw4_0310829");

  std::string map_path = path+"/pcd_file/map.pcd";
  std::string scene_path = path + "/pcd_file/scene.pcd";

  if (pcl::io::loadPCDFile<pcl::PointXYZ> (map_path, *map) == -1) 
  {
    PCL_ERROR ("Couldn't read file map.pcd \n");
    return (-1);
  }

  if (pcl::io::loadPCDFile<pcl::PointXYZ> (scene_path, *scene) == -1) 
  {
    PCL_ERROR ("Couldn't read file scene.pcd \n");
    return (-1);
  }


  float theta = -3.14159/4;

  Eigen::Matrix4f transform_1 = Eigen::Matrix4f::Identity();
  transform_1 (0,0) = cos (theta);
  transform_1 (0,1) = -sin(theta);
  transform_1 (1,0) = sin (theta);
  transform_1 (1,1) = cos (theta);

  transform_1 (0,3) = 5.0;
  transform_1 (1,3) = -57.5;
  transform_1 (2,3) = 0.8;

  // Eigen::Affine3f transform = Eigen::Affine3f::Identity();
  // transform.translation() << 5.45,-56.55,0.8;
  // transform.rotate (Eigen::AngleAxisf (theta, Eigen::Vector3f::UnitZ()));

  // pcl::transformPointCloud (*scene, *transformed_cloud, transform_1);

  sensor_msgs::PointCloud2 map_msg;
  sensor_msgs::PointCloud2 scene_msg;
  sensor_msgs::PointCloud2 transform_msg;


  pcl::IterativeClosestPoint<pcl::PointXYZ, pcl::PointXYZ> icp;
  icp.setInputCloud(scene);
  icp.setInputTarget(map);
  icp.setMaximumIterations (500);
  icp.setTransformationEpsilon (1e-9);
  icp.align(*transformed_cloud,transform_1);

  pcl::toROSMsg(*map, map_msg);
  pcl::toROSMsg(*scene, scene_msg);
  pcl::toROSMsg(*transformed_cloud, transform_msg);

  std::cout << icp.getFinalTransformation() << std::endl;

  Eigen::Matrix4f transform_matrix = icp.getFinalTransformation();
  Eigen::Matrix3f rotation_matrix(3,3);
  rotation_matrix<<transform_matrix(0,0),transform_matrix(0,1),transform_matrix(0,2),transform_matrix(1,0),transform_matrix(1,1),transform_matrix(1,2),transform_matrix(2,0),transform_matrix(2,1),transform_matrix(2,2);
  Eigen::Quaternion<float> q(rotation_matrix); 

  map_msg.header.frame_id = "/map";
  transform_msg.header.frame_id = "/map";
  scene_msg.header.frame_id = "/scene";


  static tf::TransformBroadcaster br;
  tf::Transform transform;
  transform.setOrigin( tf::Vector3(transform_matrix(0,3), transform_matrix(1,3), transform_matrix(2,3)) );
  tf::Quaternion tf_q(q.x(),q.y(),q.z(),q.w());
  transform.setRotation(tf_q);


  while(ros::ok())
  {
    map_pub.publish(map_msg);
    scene_pub.publish(scene_msg);
    transform_pub.publish(transform_msg);
    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "map", "scene"));
    r.sleep();
    ros::spinOnce();
  }


  //  sensor_msgs::PointCloud2 cloud2;
  //       pcl::toROSMsg(*cloud, cloud2);
  //       cloud2.header.frame_id = "point_cloud_link";
  //       cloud2.header.stamp = ros::Time::now();
  //       pub.publish(cloud2);


  return 0;
}