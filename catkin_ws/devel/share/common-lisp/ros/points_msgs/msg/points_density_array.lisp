; Auto-generated. Do not edit!


(cl:in-package points_msgs-msg)


;//! \htmlinclude points_density_array.msg.html

(cl:defclass <points_density_array> (roslisp-msg-protocol:ros-message)
  ((points_density_array
    :reader points_density_array
    :initarg :points_density_array
    :type (cl:vector points_msgs-msg:points_density)
   :initform (cl:make-array 0 :element-type 'points_msgs-msg:points_density :initial-element (cl:make-instance 'points_msgs-msg:points_density))))
)

(cl:defclass points_density_array (<points_density_array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <points_density_array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'points_density_array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name points_msgs-msg:<points_density_array> is deprecated: use points_msgs-msg:points_density_array instead.")))

(cl:ensure-generic-function 'points_density_array-val :lambda-list '(m))
(cl:defmethod points_density_array-val ((m <points_density_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader points_msgs-msg:points_density_array-val is deprecated.  Use points_msgs-msg:points_density_array instead.")
  (points_density_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <points_density_array>) ostream)
  "Serializes a message object of type '<points_density_array>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points_density_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points_density_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <points_density_array>) istream)
  "Deserializes a message object of type '<points_density_array>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points_density_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points_density_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'points_msgs-msg:points_density))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<points_density_array>)))
  "Returns string type for a message object of type '<points_density_array>"
  "points_msgs/points_density_array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'points_density_array)))
  "Returns string type for a message object of type 'points_density_array"
  "points_msgs/points_density_array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<points_density_array>)))
  "Returns md5sum for a message object of type '<points_density_array>"
  "b858f0c0e7e13b1ca36b528932bc5670")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'points_density_array)))
  "Returns md5sum for a message object of type 'points_density_array"
  "b858f0c0e7e13b1ca36b528932bc5670")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<points_density_array>)))
  "Returns full string definition for message of type '<points_density_array>"
  (cl:format cl:nil "points_density[] points_density_array~%================================================================================~%MSG: points_msgs/points_density~%int32 points_num ~%float32 points_int~%float64 dist_num ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'points_density_array)))
  "Returns full string definition for message of type 'points_density_array"
  (cl:format cl:nil "points_density[] points_density_array~%================================================================================~%MSG: points_msgs/points_density~%int32 points_num ~%float32 points_int~%float64 dist_num ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <points_density_array>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points_density_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <points_density_array>))
  "Converts a ROS message object to a list"
  (cl:list 'points_density_array
    (cl:cons ':points_density_array (points_density_array msg))
))
