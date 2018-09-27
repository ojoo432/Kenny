;; Auto-generated. Do not edit!


(when (boundp 'msgs::points_density)
  (if (not (find-package "MSGS"))
    (make-package "MSGS"))
  (shadow 'points_density (find-package "MSGS")))
(unless (find-package "MSGS::POINTS_DENSITY")
  (make-package "MSGS::POINTS_DENSITY"))

(in-package "ROS")
;;//! \htmlinclude points_density.msg.html


(defclass msgs::points_density
  :super ros::object
  :slots (_points_count _dist_num ))

(defmethod msgs::points_density
  (:init
   (&key
    ((:points_count __points_count) 0)
    ((:dist_num __dist_num) 0.0)
    )
   (send-super :init)
   (setq _points_count (round __points_count))
   (setq _dist_num (float __dist_num))
   self)
  (:points_count
   (&optional __points_count)
   (if __points_count (setq _points_count __points_count)) _points_count)
  (:dist_num
   (&optional __dist_num)
   (if __dist_num (setq _dist_num __dist_num)) _dist_num)
  (:serialization-length
   ()
   (+
    ;; int32 _points_count
    4
    ;; float64 _dist_num
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _points_count
       (write-long _points_count s)
     ;; float64 _dist_num
       (sys::poke _dist_num (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _points_count
     (setq _points_count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _dist_num
     (setq _dist_num (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get msgs::points_density :md5sum-) "89fea7ea0e73827d3f5c4993ca4032d2")
(setf (get msgs::points_density :datatype-) "msgs/points_density")
(setf (get msgs::points_density :definition-)
      "int32 points_count
float64 dist_num
")



(provide :msgs/points_density "89fea7ea0e73827d3f5c4993ca4032d2")


