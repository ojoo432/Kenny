# Install script for directory: /home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/points_msgs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/points_msgs/msg" TYPE FILE FILES
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/points_msgs/msg/points_density.msg"
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/points_msgs/msg/points_density_array.msg"
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/points_msgs/msg/plane_coefficients.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/points_msgs/cmake" TYPE FILE FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/build/points_msgs/catkin_generated/installspace/points_msgs-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/include/points_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/share/roseus/ros/points_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/share/common-lisp/ros/points_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/share/gennodejs/ros/points_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/lib/python2.7/dist-packages/points_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/devel/lib/python2.7/dist-packages/points_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/build/points_msgs/catkin_generated/installspace/points_msgs.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/points_msgs/cmake" TYPE FILE FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/build/points_msgs/catkin_generated/installspace/points_msgs-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/points_msgs/cmake" TYPE FILE FILES
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/build/points_msgs/catkin_generated/installspace/points_msgsConfig.cmake"
    "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/build/points_msgs/catkin_generated/installspace/points_msgsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/points_msgs" TYPE FILE FILES "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/points_msgs/package.xml")
endif()

