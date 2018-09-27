# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "vector_map: 4 messages, 0 services")

set(MSG_I_FLAGS "-Ivector_map:/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(vector_map_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg" NAME_WE)
add_custom_target(_vector_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vector_map" "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg" "vector_map/waypoint_publish"
)

get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg" NAME_WE)
add_custom_target(_vector_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vector_map" "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg" ""
)

get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg" NAME_WE)
add_custom_target(_vector_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vector_map" "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg" ""
)

get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg" NAME_WE)
add_custom_target(_vector_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vector_map" "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg" "vector_map/road_marking"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vector_map
)
_generate_msg_cpp(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vector_map
)
_generate_msg_cpp(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vector_map
)
_generate_msg_cpp(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vector_map
)

### Generating Services

### Generating Module File
_generate_module_cpp(vector_map
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vector_map
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(vector_map_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(vector_map_generate_messages vector_map_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_cpp _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_cpp _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_cpp _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_cpp _vector_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vector_map_gencpp)
add_dependencies(vector_map_gencpp vector_map_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vector_map_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vector_map
)
_generate_msg_eus(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vector_map
)
_generate_msg_eus(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vector_map
)
_generate_msg_eus(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vector_map
)

### Generating Services

### Generating Module File
_generate_module_eus(vector_map
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vector_map
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(vector_map_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(vector_map_generate_messages vector_map_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_eus _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_eus _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_eus _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_eus _vector_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vector_map_geneus)
add_dependencies(vector_map_geneus vector_map_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vector_map_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vector_map
)
_generate_msg_lisp(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vector_map
)
_generate_msg_lisp(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vector_map
)
_generate_msg_lisp(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vector_map
)

### Generating Services

### Generating Module File
_generate_module_lisp(vector_map
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vector_map
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(vector_map_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(vector_map_generate_messages vector_map_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_lisp _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_lisp _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_lisp _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_lisp _vector_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vector_map_genlisp)
add_dependencies(vector_map_genlisp vector_map_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vector_map_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vector_map
)
_generate_msg_nodejs(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vector_map
)
_generate_msg_nodejs(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vector_map
)
_generate_msg_nodejs(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vector_map
)

### Generating Services

### Generating Module File
_generate_module_nodejs(vector_map
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vector_map
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(vector_map_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(vector_map_generate_messages vector_map_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_nodejs _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_nodejs _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_nodejs _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_nodejs _vector_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vector_map_gennodejs)
add_dependencies(vector_map_gennodejs vector_map_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vector_map_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vector_map
)
_generate_msg_py(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vector_map
)
_generate_msg_py(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vector_map
)
_generate_msg_py(vector_map
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg"
  "${MSG_I_FLAGS}"
  "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vector_map
)

### Generating Services

### Generating Module File
_generate_module_py(vector_map
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vector_map
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(vector_map_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(vector_map_generate_messages vector_map_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoints_array.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_py _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_py _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/waypoint_publish.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_py _vector_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg/road_marking_array.msg" NAME_WE)
add_dependencies(vector_map_generate_messages_py _vector_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vector_map_genpy)
add_dependencies(vector_map_genpy vector_map_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vector_map_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vector_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vector_map
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(vector_map_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vector_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vector_map
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(vector_map_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vector_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vector_map
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(vector_map_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vector_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vector_map
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(vector_map_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vector_map)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vector_map\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vector_map
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(vector_map_generate_messages_py std_msgs_generate_messages_py)
endif()
