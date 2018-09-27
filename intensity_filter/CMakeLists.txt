cmake_minimum_required(VERSION 2.6 FATAL_ERROR)

project(pcl_intensity_filter)

find_package(PCL 1.2 REQUIRED)

include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})

add_executable (intensity_filter intensity_filter.cpp)
target_link_libraries (intensity_filter ${PCL_LIBRARIES})