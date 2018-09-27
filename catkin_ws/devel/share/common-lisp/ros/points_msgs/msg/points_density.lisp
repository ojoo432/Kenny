; Auto-generated. Do not edit!


(cl:in-package points_msgs-msg)


;//! \htmlinclude points_density.msg.html

(cl:defclass <points_density> (roslisp-msg-protocol:ros-message)
  ((points_num
    :reader points_num
    :initarg :points_num
    :type cl:integer
    :initform 0)
   (points_int
    :reader points_int
    :initarg :points_int
    :type cl:float
    :initform 0.0)
   (dist_num
    :reader dist_num
    :initarg :dist_num
    :type cl:float
    :initform 0.0))
)

(cl:defclass points_density (<points_density>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <points_density>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'points_density)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name points_msgs-msg:<points_density> is deprecated: use points_msgs-msg:points_density instead.")))

(cl:ensure-generic-function 'points_num-val :lambda-list '(m))
(cl:defmethod points_num-val ((m <points_density>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader points_msgs-msg:points_num-val is deprecated.  Use points_msgs-msg:points_num instead.")
  (points_num m))

(cl:ensure-generic-function 'points_int-val :lambda-list '(m))
(cl:defmethod points_int-val ((m <points_density>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader points_msgs-msg:points_int-val is deprecated.  Use points_msgs-msg:points_int instead.")
  (points_int m))

(cl:ensure-generic-function 'dist_num-val :lambda-list '(m))
(cl:defmethod dist_num-val ((m <points_density>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader points_msgs-msg:dist_num-val is deprecated.  Use points_msgs-msg:dist_num instead.")
  (dist_num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <points_density>) ostream)
  "Serializes a message object of type '<points_density>"
  (cl:let* ((signed (cl:slot-value msg 'points_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'points_int))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dist_num))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <points_density>) istream)
  "Deserializes a message object of type '<points_density>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'points_num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'points_int) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dist_num) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<points_density>)))
  "Returns string type for a message object of type '<points_density>"
  "points_msgs/points_density")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'points_density)))
  "Returns string type for a message object of type 'points_density"
  "points_msgs/points_density")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<points_density>)))
  "Returns md5sum for a message object of type '<points_density>"
  "7c990c22312891c33f02a93bc686cb7f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'points_density)))
  "Returns md5sum for a message object of type 'points_density"
  "7c990c22312891c33f02a93bc686cb7f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<points_density>)))
  "Returns full string definition for message of type '<points_density>"
  (cl:format cl:nil "int32 points_num ~%float32 points_int~%float64 dist_num ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'points_density)))
  "Returns full string definition for message of type 'points_density"
  (cl:format cl:nil "int32 points_num ~%float32 points_int~%float64 dist_num ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <points_density>))
  (cl:+ 0
     4
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <points_density>))
  "Converts a ROS message object to a list"
  (cl:list 'points_density
    (cl:cons ':points_num (points_num msg))
    (cl:cons ':points_int (points_int msg))
    (cl:cons ':dist_num (dist_num msg))
))
