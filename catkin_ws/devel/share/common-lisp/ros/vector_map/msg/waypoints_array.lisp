; Auto-generated. Do not edit!


(cl:in-package vector_map-msg)


;//! \htmlinclude waypoints_array.msg.html

(cl:defclass <waypoints_array> (roslisp-msg-protocol:ros-message)
  ((waypoints
    :reader waypoints
    :initarg :waypoints
    :type (cl:vector vector_map-msg:waypoint_publish)
   :initform (cl:make-array 0 :element-type 'vector_map-msg:waypoint_publish :initial-element (cl:make-instance 'vector_map-msg:waypoint_publish))))
)

(cl:defclass waypoints_array (<waypoints_array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <waypoints_array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'waypoints_array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vector_map-msg:<waypoints_array> is deprecated: use vector_map-msg:waypoints_array instead.")))

(cl:ensure-generic-function 'waypoints-val :lambda-list '(m))
(cl:defmethod waypoints-val ((m <waypoints_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:waypoints-val is deprecated.  Use vector_map-msg:waypoints instead.")
  (waypoints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <waypoints_array>) ostream)
  "Serializes a message object of type '<waypoints_array>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'waypoints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'waypoints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <waypoints_array>) istream)
  "Deserializes a message object of type '<waypoints_array>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'waypoints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'waypoints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vector_map-msg:waypoint_publish))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<waypoints_array>)))
  "Returns string type for a message object of type '<waypoints_array>"
  "vector_map/waypoints_array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'waypoints_array)))
  "Returns string type for a message object of type 'waypoints_array"
  "vector_map/waypoints_array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<waypoints_array>)))
  "Returns md5sum for a message object of type '<waypoints_array>"
  "5dd85112a2219703725eb3991320c5ee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'waypoints_array)))
  "Returns md5sum for a message object of type 'waypoints_array"
  "5dd85112a2219703725eb3991320c5ee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<waypoints_array>)))
  "Returns full string definition for message of type '<waypoints_array>"
  (cl:format cl:nil "waypoint_publish[] waypoints~%================================================================================~%MSG: vector_map/waypoint_publish~%int32 id~%int32 lane_id~%float32 x~%float32 y~%float32 z~%int32 point_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'waypoints_array)))
  "Returns full string definition for message of type 'waypoints_array"
  (cl:format cl:nil "waypoint_publish[] waypoints~%================================================================================~%MSG: vector_map/waypoint_publish~%int32 id~%int32 lane_id~%float32 x~%float32 y~%float32 z~%int32 point_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <waypoints_array>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'waypoints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <waypoints_array>))
  "Converts a ROS message object to a list"
  (cl:list 'waypoints_array
    (cl:cons ':waypoints (waypoints msg))
))
