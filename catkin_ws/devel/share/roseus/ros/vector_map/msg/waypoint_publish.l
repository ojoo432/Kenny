;; Auto-generated. Do not edit!


(when (boundp 'vector_map::waypoint_publish)
  (if (not (find-package "VECTOR_MAP"))
    (make-package "VECTOR_MAP"))
  (shadow 'waypoint_publish (find-package "VECTOR_MAP")))
(unless (find-package "VECTOR_MAP::WAYPOINT_PUBLISH")
  (make-package "VECTOR_MAP::WAYPOINT_PUBLISH"))

(in-package "ROS")
;;//! \htmlinclude waypoint_publish.msg.html


(defclass vector_map::waypoint_publish
  :super ros::object
  :slots (_id _lane_id _x _y _z _point_id ))

(defmethod vector_map::waypoint_publish
  (:init
   (&key
    ((:id __id) 0)
    ((:lane_id __lane_id) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:point_id __point_id) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _lane_id (round __lane_id))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _point_id (round __point_id))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:lane_id
   (&optional __lane_id)
   (if __lane_id (setq _lane_id __lane_id)) _lane_id)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:point_id
   (&optional __point_id)
   (if __point_id (setq _point_id __point_id)) _point_id)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int32 _lane_id
    4
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; int32 _point_id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int32 _lane_id
       (write-long _lane_id s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _point_id
       (write-long _point_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _lane_id
     (setq _lane_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _point_id
     (setq _point_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get vector_map::waypoint_publish :md5sum-) "b8de86b3a311006a3fa718fe285ae80e")
(setf (get vector_map::waypoint_publish :datatype-) "vector_map/waypoint_publish")
(setf (get vector_map::waypoint_publish :definition-)
      "int32 id
int32 lane_id
float32 x
float32 y
float32 z
int32 point_id

")



(provide :vector_map/waypoint_publish "b8de86b3a311006a3fa718fe285ae80e")


