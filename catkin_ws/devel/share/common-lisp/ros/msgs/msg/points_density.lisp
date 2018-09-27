; Auto-generated. Do not edit!


(cl:in-package msgs-msg)


;//! \htmlinclude points_density.msg.html

(cl:defclass <points_density> (roslisp-msg-protocol:ros-message)
  ((points_count
    :reader points_count
    :initarg :points_count
    :type cl:integer
    :initform 0)
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
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs-msg:<points_density> is deprecated: use msgs-msg:points_density instead.")))

(cl:ensure-generic-function 'points_count-val :lambda-list '(m))
(cl:defmethod points_count-val ((m <points_density>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:points_count-val is deprecated.  Use msgs-msg:points_count instead.")
  (points_count m))

(cl:ensure-generic-function 'dist_num-val :lambda-list '(m))
(cl:defmethod dist_num-val ((m <points_density>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs-msg:dist_num-val is deprecated.  Use msgs-msg:dist_num instead.")
  (dist_num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <points_density>) ostream)
  "Serializes a message object of type '<points_density>"
  (cl:let* ((signed (cl:slot-value msg 'points_count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
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
      (cl:setf (cl:slot-value msg 'points_count) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
  "msgs/points_density")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'points_density)))
  "Returns string type for a message object of type 'points_density"
  "msgs/points_density")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<points_density>)))
  "Returns md5sum for a message object of type '<points_density>"
  "89fea7ea0e73827d3f5c4993ca4032d2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'points_density)))
  "Returns md5sum for a message object of type 'points_density"
  "89fea7ea0e73827d3f5c4993ca4032d2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<points_density>)))
  "Returns full string definition for message of type '<points_density>"
  (cl:format cl:nil "int32 points_count~%float64 dist_num~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'points_density)))
  "Returns full string definition for message of type 'points_density"
  (cl:format cl:nil "int32 points_count~%float64 dist_num~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <points_density>))
  (cl:+ 0
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <points_density>))
  "Converts a ROS message object to a list"
  (cl:list 'points_density
    (cl:cons ':points_count (points_count msg))
    (cl:cons ':dist_num (dist_num msg))
))
