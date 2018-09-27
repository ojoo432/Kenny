
(cl:in-package :asdf)

(defsystem "vector_map-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "road_marking" :depends-on ("_package_road_marking"))
    (:file "_package_road_marking" :depends-on ("_package"))
    (:file "road_marking_array" :depends-on ("_package_road_marking_array"))
    (:file "_package_road_marking_array" :depends-on ("_package"))
    (:file "waypoint_publish" :depends-on ("_package_waypoint_publish"))
    (:file "_package_waypoint_publish" :depends-on ("_package"))
    (:file "waypoints_array" :depends-on ("_package_waypoints_array"))
    (:file "_package_waypoints_array" :depends-on ("_package"))
  ))