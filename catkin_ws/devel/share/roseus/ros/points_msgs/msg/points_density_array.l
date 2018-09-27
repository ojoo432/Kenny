;; Auto-generated. Do not edit!


(when (boundp 'points_msgs::points_density_array)
  (if (not (find-package "POINTS_MSGS"))
    (make-package "POINTS_MSGS"))
  (shadow 'points_density_array (find-package "POINTS_MSGS")))
(unless (find-package "POINTS_MSGS::POINTS_DENSITY_ARRAY")
  (make-package "POINTS_MSGS::POINTS_DENSITY_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude points_density_array.msg.html


(defclass points_msgs::points_density_array
  :super ros::object
  :slots (_points_density_array ))

(defmethod points_msgs::points_density_array
  (:init
   (&key
    ((:points_density_array __points_density_array) (let (r) (dotimes (i 0) (push (instance points_msgs::points_density :init) r)) r))
    )
   (send-super :init)
   (setq _points_density_array __points_density_array)
   self)
  (:points_density_array
   (&rest __points_density_array)
   (if (keywordp (car __points_density_array))
       (send* _points_density_array __points_density_array)
     (progn
       (if __points_density_array (setq _points_density_array (car __points_density_array)))
       _points_density_array)))
  (:serialization-length
   ()
   (+
    ;; points_msgs/points_density[] _points_density_array
    (apply #'+ (send-all _points_density_array :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; points_msgs/points_density[] _points_density_array
     (write-long (length _points_density_array) s)
     (dolist (elem _points_density_array)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; points_msgs/points_density[] _points_density_array
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points_density_array (let (r) (dotimes (i n) (push (instance points_msgs::points_density :init) r)) r))
     (dolist (elem- _points_density_array)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get points_msgs::points_density_array :md5sum-) "b858f0c0e7e13b1ca36b528932bc5670")
(setf (get points_msgs::points_density_array :datatype-) "points_msgs/points_density_array")
(setf (get points_msgs::points_density_array :definition-)
      "points_density[] points_density_array
================================================================================
MSG: points_msgs/points_density
int32 points_num 
float32 points_int
float64 dist_num 
")



(provide :points_msgs/points_density_array "b858f0c0e7e13b1ca36b528932bc5670")


