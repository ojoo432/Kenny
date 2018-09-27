;; Auto-generated. Do not edit!


(when (boundp 'vector_map::road_marking)
  (if (not (find-package "VECTOR_MAP"))
    (make-package "VECTOR_MAP"))
  (shadow 'road_marking (find-package "VECTOR_MAP")))
(unless (find-package "VECTOR_MAP::ROAD_MARKING")
  (make-package "VECTOR_MAP::ROAD_MARKING"))

(in-package "ROS")
;;//! \htmlinclude road_marking.msg.html


(defclass vector_map::road_marking
  :super ros::object
  :slots (_id _lane_id _category _w_id ))

(defmethod vector_map::road_marking
  (:init
   (&key
    ((:id __id) 0)
    ((:lane_id __lane_id) 0)
    ((:category __category) 0)
    ((:w_id __w_id) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _lane_id (round __lane_id))
   (setq _category (round __category))
   (setq _w_id (round __w_id))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:lane_id
   (&optional __lane_id)
   (if __lane_id (setq _lane_id __lane_id)) _lane_id)
  (:category
   (&optional __category)
   (if __category (setq _category __category)) _category)
  (:w_id
   (&optional __w_id)
   (if __w_id (setq _w_id __w_id)) _w_id)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int32 _lane_id
    4
    ;; int32 _category
    4
    ;; int32 _w_id
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
     ;; int32 _category
       (write-long _category s)
     ;; int32 _w_id
       (write-long _w_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _lane_id
     (setq _lane_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _category
     (setq _category (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _w_id
     (setq _w_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get vector_map::road_marking :md5sum-) "b23ce3f5a689c4f090cba80b81e2e4b9")
(setf (get vector_map::road_marking :datatype-) "vector_map/road_marking")
(setf (get vector_map::road_marking :definition-)
      "int32 id
int32 lane_id
int32 category
int32 w_id
")



(provide :vector_map/road_marking "b23ce3f5a689c4f090cba80b81e2e4b9")


