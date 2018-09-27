
#include <iostream>
#include <string>
#include <boost/thread/thread.hpp>
#include <pcl/common/common_headers.h>
#include <pcl/features/normal_3d.h>
#include <pcl/io/pcd_io.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/console/parse.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/segmentation/progressive_morphological_filter.h>


int main(){
pcl::PointCloud<pcl::PointXYZI>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZI>);
pcl::PointCloud<pcl::PointXYZI>::Ptr cloud_filtered (new pcl::PointCloud<pcl::PointXYZI>);
pcl::PointIndicesPtr ground (new pcl::PointIndices);


 for(int i=0;i<2;i++)
 {


std::string sub = "submap_";
std::string sub2 = "submap_g";
std::string pcd = ".pcd";
int number = 1;
number = number +i;
std::string input = (sub + boost::to_string(number)+pcd);
std::string output = (sub2 + boost::to_string(number)+pcd);


if (pcl::io::loadPCDFile<pcl::PointXYZI> (input, *cloud) == -1) //*
  {
    PCL_ERROR ("Couldn't read file  \n");
    return (-1);
  }

  std::cerr << "Cloud before filtering: " << std::endl;
  std::cerr << *cloud << std::endl;

 // Create the filtering object
  pcl::ProgressiveMorphologicalFilter<pcl::PointXYZI> pmf;
  pmf.setInputCloud (cloud);
  pmf.setMaxWindowSize (10);
  pmf.setSlope (1.0f);
  pmf.setInitialDistance (0.5f);
  pmf.setMaxDistance (3.0f);
  pmf.extract (ground->indices);

  // Create the filtering object
  pcl::ExtractIndices<pcl::PointXYZI> extract;
  extract.setInputCloud (cloud);
  extract.setIndices (ground);
  extract.filter (*cloud_filtered);

  std::cerr << "Ground cloud after filtering: " << std::endl;
  std::cerr << *cloud_filtered << std::endl;


   // boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
   // viewer->setBackgroundColor (0, 0, 0);

   // pcl::visualization::PointCloudColorHandlerGenericField<pcl::PointXYZI> intensity_distribution(cloud_filtered, "intensity");
   // viewer->addPointCloud<pcl::PointXYZI> (cloud_filtered, intensity_distribution,"sample cloud"); 

  pcl::PCDWriter writer;
  writer.write<pcl::PointXYZI> (output, *cloud_filtered, false);

//   std::cerr << "Done" << std::endl;
//    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "sample cloud");
//   viewer->addCoordinateSystem (1.0);
//   viewer->initCameraParameters ();

// while (!viewer->wasStopped ())
//   {
//     viewer->spinOnce (100);
//     boost::this_thread::sleep (boost::posix_time::microseconds (100000));
//   }
 }
} 