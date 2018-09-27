;; Auto-generated. Do not edit!


(when (boundp 'vector_map::waypoints_array)
  (if (not (find-package "VECTOR_MAP"))
    (make-package "VECTOR_MAP"))
  (shadow 'waypoints_array (find-package "VECTOR_MAP")))
(unless (find-package "VECTOR_MAP::WAYPOINTS_ARRAY")
  (make-package "VECTOR_MAP::WAYPOINTS_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude waypoints_array.msg.html


(defclass vector_map::waypoints_array
  :super ros::object
  :slots (_waypoints ))

(defmethod vector_map::waypoints_array
  (:init
   (&key
    ((:waypoints __waypoints) (let (r) (dotimes (i 0) (push (instance vector_map::waypoint_publish :init) r)) r))
    )
   (send-super :init)
   (setq _waypoints __waypoints)
   self)
  (:waypoints
   (&rest __waypoints)
   (if (keywordp (car __waypoints))
       (send* _waypoints __waypoints)
     (progn
       (if __waypoints (setq _waypoints (car __waypoints)))
       _waypoints)))
  (:serialization-length
   ()
   (+
    ;; vector_map/waypoint_publish[] _waypoints
    (apply #'+ (send-all _waypoints :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; vector_map/waypoint_publish[] _waypoints
     (write-long (length _waypoints) s)
     (dolist (elem _waypoints)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; vector_map/waypoint_publish[] _waypoints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _waypoints (let (r) (dotimes (i n) (push (instance vector_map::waypoint_publish :init) r)) r))
     (dolist (elem- _waypoints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get vector_map::waypoints_array :md5sum-) "5dd85112a2219703725eb3991320c5ee")
(setf (get vector_map::waypoints_array :datatype-) "vector_map/waypoints_array")
(setf (get vector_map::waypoints_array :definition-)
      "waypoint_publish[] waypoints
================================================================================
MSG: vector_map/waypoint_publish
int32 id
int32 lane_id
float32 x
float32 y
float32 z
int32 point_id

")



(provide :vector_map/waypoints_array "5dd85112a2219703725eb3991320c5ee")


