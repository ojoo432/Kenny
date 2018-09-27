;; Auto-generated. Do not edit!


(when (boundp 'points_msgs::plane_coefficients)
  (if (not (find-package "POINTS_MSGS"))
    (make-package "POINTS_MSGS"))
  (shadow 'plane_coefficients (find-package "POINTS_MSGS")))
(unless (find-package "POINTS_MSGS::PLANE_COEFFICIENTS")
  (make-package "POINTS_MSGS::PLANE_COEFFICIENTS"))

(in-package "ROS")
;;//! \htmlinclude plane_coefficients.msg.html


(defclass points_msgs::plane_coefficients
  :super ros::object
  :slots (_a _b _c _d ))

(defmethod points_msgs::plane_coefficients
  (:init
   (&key
    ((:a __a) 0.0)
    ((:b __b) 0.0)
    ((:c __c) 0.0)
    ((:d __d) 0.0)
    )
   (send-super :init)
   (setq _a (float __a))
   (setq _b (float __b))
   (setq _c (float __c))
   (setq _d (float __d))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:c
   (&optional __c)
   (if __c (setq _c __c)) _c)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:serialization-length
   ()
   (+
    ;; float64 _a
    8
    ;; float64 _b
    8
    ;; float64 _c
    8
    ;; float64 _d
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _a
       (sys::poke _a (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _b
       (sys::poke _b (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _c
       (sys::poke _c (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _d
       (sys::poke _d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _a
     (setq _a (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _b
     (setq _b (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _c
     (setq _c (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _d
     (setq _d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get points_msgs::plane_coefficients :md5sum-) "b5c1b8d0c23e6e29f5d8d9fbdb957dac")
(setf (get points_msgs::plane_coefficients :datatype-) "points_msgs/plane_coefficients")
(setf (get points_msgs::plane_coefficients :definition-)
      "float64 a
float64 b
float64 c
float64 d
")



(provide :points_msgs/plane_coefficients "b5c1b8d0c23e6e29f5d8d9fbdb957dac")

