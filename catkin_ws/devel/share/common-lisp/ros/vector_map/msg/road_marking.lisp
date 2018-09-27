; Auto-generated. Do not edit!


(cl:in-package vector_map-msg)


;//! \htmlinclude road_marking.msg.html

(cl:defclass <road_marking> (roslisp-msg-protocol:ros-message)
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
   (category
    :reader category
    :initarg :category
    :type cl:integer
    :initform 0)
   (w_id
    :reader w_id
    :initarg :w_id
    :type cl:integer
    :initform 0))
)

(cl:defclass road_marking (<road_marking>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <road_marking>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'road_marking)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vector_map-msg:<road_marking> is deprecated: use vector_map-msg:road_marking instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <road_marking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:id-val is deprecated.  Use vector_map-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'lane_id-val :lambda-list '(m))
(cl:defmethod lane_id-val ((m <road_marking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:lane_id-val is deprecated.  Use vector_map-msg:lane_id instead.")
  (lane_id m))

(cl:ensure-generic-function 'category-val :lambda-list '(m))
(cl:defmethod category-val ((m <road_marking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:category-val is deprecated.  Use vector_map-msg:category instead.")
  (category m))

(cl:ensure-generic-function 'w_id-val :lambda-list '(m))
(cl:defmethod w_id-val ((m <road_marking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:w_id-val is deprecated.  Use vector_map-msg:w_id instead.")
  (w_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <road_marking>) ostream)
  "Serializes a message object of type '<road_marking>"
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
  (cl:let* ((signed (cl:slot-value msg 'category)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'w_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <road_marking>) istream)
  "Deserializes a message object of type '<road_marking>"
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'category) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'w_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<road_marking>)))
  "Returns string type for a message object of type '<road_marking>"
  "vector_map/road_marking")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'road_marking)))
  "Returns string type for a message object of type 'road_marking"
  "vector_map/road_marking")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<road_marking>)))
  "Returns md5sum for a message object of type '<road_marking>"
  "b23ce3f5a689c4f090cba80b81e2e4b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'road_marking)))
  "Returns md5sum for a message object of type 'road_marking"
  "b23ce3f5a689c4f090cba80b81e2e4b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<road_marking>)))
  "Returns full string definition for message of type '<road_marking>"
  (cl:format cl:nil "int32 id~%int32 lane_id~%int32 category~%int32 w_id~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'road_marking)))
  "Returns full string definition for message of type 'road_marking"
  (cl:format cl:nil "int32 id~%int32 lane_id~%int32 category~%int32 w_id~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <road_marking>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <road_marking>))
  "Converts a ROS message object to a list"
  (cl:list 'road_marking
    (cl:cons ':id (id msg))
    (cl:cons ':lane_id (lane_id msg))
    (cl:cons ':category (category msg))
    (cl:cons ':w_id (w_id msg))
))
