;; Auto-generated. Do not edit!


(when (boundp 'vector_map::road_marking_array)
  (if (not (find-package "VECTOR_MAP"))
    (make-package "VECTOR_MAP"))
  (shadow 'road_marking_array (find-package "VECTOR_MAP")))
(unless (find-package "VECTOR_MAP::ROAD_MARKING_ARRAY")
  (make-package "VECTOR_MAP::ROAD_MARKING_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude road_marking_array.msg.html


(defclass vector_map::road_marking_array
  :super ros::object
  :slots (_road_markings ))

(defmethod vector_map::road_marking_array
  (:init
   (&key
    ((:road_markings __road_markings) (let (r) (dotimes (i 0) (push (instance vector_map::road_marking :init) r)) r))
    )
   (send-super :init)
   (setq _road_markings __road_markings)
   self)
  (:road_markings
   (&rest __road_markings)
   (if (keywordp (car __road_markings))
       (send* _road_markings __road_markings)
     (progn
       (if __road_markings (setq _road_markings (car __road_markings)))
       _road_markings)))
  (:serialization-length
   ()
   (+
    ;; vector_map/road_marking[] _road_markings
    (apply #'+ (send-all _road_markings :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; vector_map/road_marking[] _road_markings
     (write-long (length _road_markings) s)
     (dolist (elem _road_markings)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; vector_map/road_marking[] _road_markings
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _road_markings (let (r) (dotimes (i n) (push (instance vector_map::road_marking :init) r)) r))
     (dolist (elem- _road_markings)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get vector_map::road_marking_array :md5sum-) "3a7bb78ec80bc5c541892726df462d56")
(setf (get vector_map::road_marking_array :datatype-) "vector_map/road_marking_array")
(setf (get vector_map::road_marking_array :definition-)
      "road_marking[] road_markings
================================================================================
MSG: vector_map/road_marking
int32 id
int32 lane_id
int32 category
int32 w_id
")



(provide :vector_map/road_marking_array "3a7bb78ec80bc5c541892726df462d56")


