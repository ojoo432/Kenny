# Install script for directory: /home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/vector_map/msg" TYPE FILE FILES
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg"
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/vector_map/cmake" TYPE FILE FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/build/vector_map/catkin_generated/installspace/vector_map-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/include/vector_map")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/share/roseus/ros/vector_map")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/share/common-lisp/ros/vector_map")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/share/gennodejs/ros/vector_map")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/lib/python2.7/dist-packages/vector_map")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/lib/python2.7/dist-packages/vector_map")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/build/vector_map/catkin_generated/installspace/vector_map.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/vector_map/cmake" TYPE FILE FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/build/vector_map/catkin_generated/installspace/vector_map-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/vector_map/cmake" TYPE FILE FILES
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/build/vector_map/catkin_generated/installspace/vector_mapConfig.cmake"
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/build/vector_map/catkin_generated/installspace/vector_mapConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/vector_map" TYPE FILE FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/package.xml")
endif()

