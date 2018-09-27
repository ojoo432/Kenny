
#include <iostream>
#include <string>
#include <boost/thread/thread.hpp>
#include <pcl/common/common_headers.h>
#include <pcl/features/normal_3d.h>
#include <pcl/io/pcd_io.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/console/parse.h>
#include <pcl/filters/passthrough.h>


int main(){
pcl::PointCloud<pcl::PointXYZI>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZI>);
pcl::PointCloud<pcl::PointXYZI>::Ptr cloud_filtered (new pcl::PointCloud<pcl::PointXYZI>);


if (pcl::io::loadPCDFile<pcl::PointXYZI> ("submap_g4.pcd", *cloud) == -1) //*
  {
    PCL_ERROR ("Couldn't read file  \n");
    return (-1);
  }

  std::cerr << "Cloud before filtering: " << std::endl;
  std::cerr << *cloud << std::endl;

 // Create the filtering object
  pcl::PassThrough<pcl::PointXYZI> pass;
  pass.setInputCloud (cloud);
  pass.setFilterFieldName ("intensity");
  pass.setFilterLimits (0.0, 8.0);
  //pass.setFilterLimitsNegative (true);
  pass.filter (*cloud_filtered);


  std::cerr << "Ground cloud after filtering: " << std::endl;
  std::cerr << *cloud_filtered << std::endl;


   boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
   viewer->setBackgroundColor (0, 0, 0);

   pcl::visualization::PointCloudColorHandlerGenericField<pcl::PointXYZI> intensity_distribution(cloud_filtered, "intensity");
   viewer->addPointCloud<pcl::PointXYZI> (cloud_filtered, intensity_distribution,"sample cloud"); 

  // pcl::PCDWriter writer;
  // writer.write<pcl::PointXYZI> ("submap_g4.pcd", *cloud_filtered, false);

  std::cerr << "Done" << std::endl;
   viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "sample cloud");
  viewer->addCoordinateSystem (1.0);
  viewer->initCameraParameters ();

while (!viewer->wasStopped ())
  {
    viewer->spinOnce (100);
    boost::this_thread::sleep (boost::posix_time::microseconds (100000));
  }
} 