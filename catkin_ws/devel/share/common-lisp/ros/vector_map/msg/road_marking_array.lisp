; Auto-generated. Do not edit!


(cl:in-package vector_map-msg)


;//! \htmlinclude road_marking_array.msg.html

(cl:defclass <road_marking_array> (roslisp-msg-protocol:ros-message)
  ((road_markings
    :reader road_markings
    :initarg :road_markings
    :type (cl:vector vector_map-msg:road_marking)
   :initform (cl:make-array 0 :element-type 'vector_map-msg:road_marking :initial-element (cl:make-instance 'vector_map-msg:road_marking))))
)

(cl:defclass road_marking_array (<road_marking_array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <road_marking_array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'road_marking_array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vector_map-msg:<road_marking_array> is deprecated: use vector_map-msg:road_marking_array instead.")))

(cl:ensure-generic-function 'road_markings-val :lambda-list '(m))
(cl:defmethod road_markings-val ((m <road_marking_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vector_map-msg:road_markings-val is deprecated.  Use vector_map-msg:road_markings instead.")
  (road_markings m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <road_marking_array>) ostream)
  "Serializes a message object of type '<road_marking_array>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'road_markings))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'road_markings))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <road_marking_array>) istream)
  "Deserializes a message object of type '<road_marking_array>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'road_markings) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'road_markings)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vector_map-msg:road_marking))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<road_marking_array>)))
  "Returns string type for a message object of type '<road_marking_array>"
  "vector_map/road_marking_array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'road_marking_array)))
  "Returns string type for a message object of type 'road_marking_array"
  "vector_map/road_marking_array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<road_marking_array>)))
  "Returns md5sum for a message object of type '<road_marking_array>"
  "3a7bb78ec80bc5c541892726df462d56")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'road_marking_array)))
  "Returns md5sum for a message object of type 'road_marking_array"
  "3a7bb78ec80bc5c541892726df462d56")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<road_marking_array>)))
  "Returns full string definition for message of type '<road_marking_array>"
  (cl:format cl:nil "road_marking[] road_markings~%================================================================================~%MSG: vector_map/road_marking~%int32 id~%int32 lane_id~%int32 category~%int32 w_id~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'road_marking_array)))
  "Returns full string definition for message of type 'road_marking_array"
  (cl:format cl:nil "road_marking[] road_markings~%================================================================================~%MSG: vector_map/road_marking~%int32 id~%int32 lane_id~%int32 category~%int32 w_id~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <road_marking_array>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'road_markings) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <road_marking_array>))
  "Converts a ROS message object to a list"
  (cl:list 'road_marking_array
    (cl:cons ':road_markings (road_markings msg))
))
