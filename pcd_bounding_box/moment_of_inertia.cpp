
#include <iostream>
#include <string>
#include <boost/thread/thread.hpp>
#include <points_msgs/plane_coefficients.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/PCLPointCloud2.h>
#include <pcl/conversions.h>
#include <pcl_ros/transforms.h>
#include <pcl_ros/point_cloud.h>
#include <Eigen/Dense>

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


void segCloud(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_ptr,const pcl::PointCloud<pcl::PointXYZI>::Ptr r_cloud_ptr, 
  pcl::PointCloud<pcl::PointXYZI>::Ptr out_cloud_ptr)
{

  pcl::PointCloud<pcl::PointXYZI>::Ptr project_cloud (new pcl::PointCloud<pcl::PointXYZI>);
 
  pcl::SACSegmentation<pcl::PointXYZI> l_seg;
  pcl::PointIndices::Ptr l_inliers(new pcl::PointIndices);
  pcl::ModelCoefficients::Ptr l_coefficients(new pcl::ModelCoefficients);

  l_seg.setOptimizeCoefficients(true);
  l_seg.setModelType(pcl::SACMODEL_LINE);
  l_seg.setMethodType(pcl::SAC_RANSAC);
  l_seg.setMaxIterations(50);
  
  l_seg.setDistanceThreshold(0.1);  // floor distance
  l_seg.setOptimizeCoefficients(true);
  l_seg.setInputCloud(in_cloud_ptr);
  l_seg.segment(*l_inliers, *l_coefficients);
  if (l_inliers->indices.size() == 0)
  {
    std::cout << "Could not estimate a LINE model for the given dataset." << std::endl;
  }

  // REMOVE THE LINE FROM THE CLOUD
 

  //[point_on_line.x point_on_line.y point_on_line.z line_direction.x line_direction.y line_direction.z] 
  std::cerr << "Model coefficients: " << l_coefficients->values[0] << " " 
                                      << l_coefficients->values[1] << " "
                                      << l_coefficients->values[2] << " " 
                                      << l_coefficients->values[3] << " "
                                      << l_coefficients->values[4] << " " 
                                      << l_coefficients->values[5] << std::endl;

  // Eigen::Vector4f line_pt(coefficients->values[0],coefficients->values[1],coefficients->values[2],0);
  // Eigen::Vector4f line_dir(coefficients->values[3],coefficients->values[4],coefficients->values[5],0);

  // for(unsigned int i=0; i< in_cloud_ptr->points.size(); i++)
  // {
   
  //   Eigen::Vector4f pt(in_cloud_ptr->points[i].x,in_cloud_ptr->points[i].y,in_cloud_ptr->points[i].z,0);
  //   float distance = pcl::sqrPointToLineDistance(pt,line_pt,line_dir);
  //   std::cout<<distance<<endl;
  // }

  // Create the filtering object
  pcl::ProjectInliers<pcl::PointXYZI> l_proj;
  l_proj.setModelType (pcl::SACMODEL_LINE);
  l_proj.setInputCloud (in_cloud_ptr);
  l_proj.setModelCoefficients (l_coefficients);
  l_proj.filter (*project_cloud);

  // for(unsigned int i=0; i< out_cloud_ptr->points.size(); i++)
  // {
   
  //   Eigen::Vector4f pt(out_cloud_ptr->points[i].x,out_cloud_ptr->points[i].y,out_cloud_ptr->points[i].z,0);
  //   float distance = pcl::sqrPointToLineDistance(pt,line_pt,line_dir);
  //   std::cout<<distance<<endl;
  // }

  pcl::SACSegmentation<pcl::PointXYZI> r_seg;
  pcl::PointIndices::Ptr r_inliers(new pcl::PointIndices);
  pcl::ModelCoefficients::Ptr r_coefficients(new pcl::ModelCoefficients);

  r_seg.setOptimizeCoefficients(true);
  r_seg.setModelType(pcl::SACMODEL_LINE);
  r_seg.setMethodType(pcl::SAC_RANSAC);
  r_seg.setMaxIterations(50);
  
  r_seg.setDistanceThreshold(0.1);  // floor distance
  r_seg.setOptimizeCoefficients(true);
  r_seg.setInputCloud(in_cloud_ptr);
  r_seg.segment(*r_inliers, *r_coefficients);
  if (r_inliers->indices.size() == 0)
  {
    std::cout << "Could not estimate a LINE model for the given dataset." << std::endl;
  }

  // REMOVE THE LINE FROM THE CLOUD
 

  //[point_on_line.x point_on_line.y point_on_line.z line_direction.x line_direction.y line_direction.z] 
  std::cerr << "Model coefficients: " << r_coefficients->values[0] << " " 
                                      << r_coefficients->values[1] << " "
                                      << r_coefficients->values[2] << " " 
                                      << r_coefficients->values[3] << " "
                                      << r_coefficients->values[4] << " " 
                                      << r_coefficients->values[5] << std::endl;
  // _pub_plane_coefficients.publish(msg);


  pcl::ProjectInliers<pcl::PointXYZI> out_proj;
  out_proj.setModelType (pcl::SACMODEL_LINE);
  out_proj.setInputCloud (project_cloud);
  out_proj.setModelCoefficients (r_coefficients);
  out_proj.filter (*out_cloud_ptr);

  for(unsigned int i=0; i< out_cloud_ptr->points.size(); i++)
  {
   
    out_cloud_ptr->points[i].x = (out_cloud_ptr->points[i].x + project_cloud->points[i].x)/2;
    out_cloud_ptr->points[i].y = (out_cloud_ptr->points[i].y + project_cloud->points[i].y)/2;
    out_cloud_ptr->points[i].z = (out_cloud_ptr->points[i].z + project_cloud->points[i].z)/2;

    std::cout<<out_cloud_ptr->points[i]<<endl;
  }
}

int main()
{
  pcl::PointCloud<pcl::PointXYZI>::Ptr l_cloud (new pcl::PointCloud<pcl::PointXYZI>);
  pcl::PointCloud<pcl::PointXYZI>::Ptr r_cloud (new pcl::PointCloud<pcl::PointXYZI>);
  pcl::PointCloud<pcl::PointXYZI>::Ptr lw_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);
  pcl::PointCloud<pcl::PointXYZI>::Ptr rw_cloud_ptr (new pcl::PointCloud<pcl::PointXYZI>);

  int size = 5;
  l_cloud->width = size;
  l_cloud->height = 1;
  l_cloud->points.resize (l_cloud->width * l_cloud->height);
  // 1.1 Add noise
  l_cloud->points[0].x = 1.2;
  l_cloud->points[0].y = 0.8;
  l_cloud->points[0].z = 0.0;

  l_cloud->points[1].x = 2.2;
  l_cloud->points[1].y = 2.0;
  l_cloud->points[1].z = 0.0;

  l_cloud->points[2].x = 2.7;
  l_cloud->points[2].y = 3.1;
  l_cloud->points[2].z = 0.0;

  l_cloud->points[3].x = 8.1;
  l_cloud->points[3].y = 2.5;
  l_cloud->points[3].z = 0.0;

  l_cloud->points[4].x = 4.0;
  l_cloud->points[4].y = 4.0;
  l_cloud->points[4].z = 0.0;

  r_cloud->width = size;
  r_cloud->height = 1;
  r_cloud->points.resize (r_cloud->width * r_cloud->height);
  // 1.1 Add noise
  r_cloud->points[0].x = -0.8;
  r_cloud->points[0].y = -1.4;
  r_cloud->points[0].z = 0.0;

  r_cloud->points[1].x = 0.3;
  r_cloud->points[1].y = 0;
  r_cloud->points[1].z = 0.0;

  r_cloud->points[2].x = 0.5;
  r_cloud->points[2].y = 1.0;
  r_cloud->points[2].z = 0.0;

  r_cloud->points[3].x = 4.1;
  r_cloud->points[3].y = 2.5;
  r_cloud->points[3].z = 0.0;

  r_cloud->points[4].x = 1.9;
  r_cloud->points[4].y = 2.0;
  r_cloud->points[4].z = 0.0;

  segCloud(l_cloud,r_cloud, lw_cloud_ptr);



 
    boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
    viewer->setBackgroundColor (0, 0, 0);

  pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZI> target_color (l_cloud, 255, 0, 0);
  viewer->addPointCloud<pcl::PointXYZI> (l_cloud, target_color, "target cloud");
  viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE,
1, "target cloud");
  
  std::cerr << "Done" << std::endl;
  viewer->addCoordinateSystem (1.0);
  viewer->initCameraParameters ();

while (!viewer->wasStopped ())
  {
    viewer->spinOnce (100);
    boost::this_thread::sleep (boost::posix_time::microseconds (100000));
  }
 }