file(REMOVE_RECURSE
  "rviz_cloud_annotation_plugin_automoc.cpp"
  "rviz_cloud_annotation_node_automoc.cpp"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/rviz_cloud_annotation_generate_messages.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
