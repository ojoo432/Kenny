; Auto-generated. Do not edit!


(cl:in-package vector_map-msg)


;//! \htmlinclude waypoint_publish.msg.html

(cl:defclass <waypoint_publish> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (lane_id
    :reader lane_id
    :initarg :lane_id
    :type cl:integer
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (point_id
    :reader point_id
    :initarg :point_id
    :type cl:integer
    :initform 0))
)

(cl:defclass waypoint_publish (<waypoint_publish>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <waypoint_publish>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'waypoint_publish)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vector_map-msg:<waypoint_publish> is deprecated: use vector_map-msg:waypoint_publish instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <waypoint_publish>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:id-val is deprecated.  Use vector_map-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'lane_id-val :lambda-list '(m))
(cl:defmethod lane_id-val ((m <waypoint_publish>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:lane_id-val is deprecated.  Use vector_map-msg:lane_id instead.")
  (lane_id m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <waypoint_publish>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:x-val is deprecated.  Use vector_map-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <waypoint_publish>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:y-val is deprecated.  Use vector_map-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <waypoint_publish>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:z-val is deprecated.  Use vector_map-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'point_id-val :lambda-list '(m))
(cl:defmethod point_id-val ((m <waypoint_publish>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:point_id-val is deprecated.  Use vector_map-msg:point_id instead.")
  (point_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <waypoint_publish>) ostream)
  "Serializes a message object of type '<waypoint_publish>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'lane_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'point_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <waypoint_publish>) istream)
  "Deserializes a message object of type '<waypoint_publish>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lane_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'point_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<waypoint_publish>)))
  "Returns string type for a message object of type '<waypoint_publish>"
  "vector_map/waypoint_publish")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'waypoint_publish)))
  "Returns string type for a message object of type 'waypoint_publish"
  "vector_map/waypoint_publish")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<waypoint_publish>)))
  "Returns md5sum for a message object of type '<waypoint_publish>"
  "b8de86b3a311006a3fa718fe285ae80e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'waypoint_publish)))
  "Returns md5sum for a message object of type 'waypoint_publish"
  "b8de86b3a311006a3fa718fe285ae80e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<waypoint_publish>)))
  "Returns full string definition for message of type '<waypoint_publish>"
  (cl:format cl:nil "int32 id~%int32 lane_id~%float32 x~%float32 y~%float32 z~%int32 point_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'waypoint_publish)))
  "Returns full string definition for message of type 'waypoint_publish"
  (cl:format cl:nil "int32 id~%int32 lane_id~%float32 x~%float32 y~%float32 z~%int32 point_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <waypoint_publish>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <waypoint_publish>))
  "Converts a ROS message object to a list"
  (cl:list 'waypoint_publish
    (cl:cons ':id (id msg))
    (cl:cons ':lane_id (lane_id msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':point_id (point_id msg))
))
