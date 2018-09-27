;; Auto-generated. Do not edit!


(when (boundp 'points_msgs::points_density)
  (if (not (find-package "POINTS_MSGS"))
    (make-package "POINTS_MSGS"))
  (shadow 'points_density (find-package "POINTS_MSGS")))
(unless (find-package "POINTS_MSGS::POINTS_DENSITY")
  (make-package "POINTS_MSGS::POINTS_DENSITY"))

(in-package "ROS")
;;//! \htmlinclude points_density.msg.html


(defclass points_msgs::points_density
  :super ros::object
  :slots (_points_num _points_int _dist_num ))

(defmethod points_msgs::points_density
  (:init
   (&key
    ((:points_num __points_num) 0)
    ((:points_int __points_int) 0.0)
    ((:dist_num __dist_num) 0.0)
    )
   (send-super :init)
   (setq _points_num (round __points_num))
   (setq _points_int (float __points_int))
   (setq _dist_num (float __dist_num))
   self)
  (:points_num
   (&optional __points_num)
   (if __points_num (setq _points_num __points_num)) _points_num)
  (:points_int
   (&optional __points_int)
   (if __points_int (setq _points_int __points_int)) _points_int)
  (:dist_num
   (&optional __dist_num)
   (if __dist_num (setq _dist_num __dist_num)) _dist_num)
  (:serialization-length
   ()
   (+
    ;; int32 _points_num
    4
    ;; float32 _points_int
    4
    ;; float64 _dist_num
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _points_num
       (write-long _points_num s)
     ;; float32 _points_int
       (sys::poke _points_int (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _dist_num
       (sys::poke _dist_num (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _points_num
     (setq _points_num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _points_int
     (setq _points_int (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _dist_num
     (setq _dist_num (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get points_msgs::points_density :md5sum-) "7c990c22312891c33f02a93bc686cb7f")
(setf (get points_msgs::points_density :datatype-) "points_msgs/points_density")
(setf (get points_msgs::points_density :definition-)
      "int32 points_num 
float32 points_int
float64 dist_num 
")



(provide :points_msgs/points_density "7c990c22312891c33f02a93bc686cb7f")


