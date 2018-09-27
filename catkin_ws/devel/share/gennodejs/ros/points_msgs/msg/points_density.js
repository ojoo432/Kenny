// Auto-generated. Do not edit!

// (in-package points_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class points_density {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.points_num = null;
      this.points_int = null;
      this.dist_num = null;
    }
    else {
      if (initObj.hasOwnProperty('points_num')) {
        this.points_num = initObj.points_num
      }
      else {
        this.points_num = 0;
      }
      if (initObj.hasOwnProperty('points_int')) {
        this.points_int = initObj.points_int
      }
      else {
        this.points_int = 0.0;
      }
      if (initObj.hasOwnProperty('dist_num')) {
        this.dist_num = initObj.dist_num
      }
      else {
        this.dist_num = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type points_density
    // Serialize message field [points_num]
    bufferOffset = _serializer.int32(obj.points_num, buffer, bufferOffset);
    // Serialize message field [points_int]
    bufferOffset = _serializer.float32(obj.points_int, buffer, bufferOffset);
    // Serialize message field [dist_num]
    bufferOffset = _serializer.float64(obj.dist_num, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type points_density
    let len;
    let data = new points_density(null);
    // Deserialize message field [points_num]
    data.points_num = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [points_int]
    data.points_int = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dist_num]
    data.dist_num = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'points_msgs/points_density';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7c990c22312891c33f02a93bc686cb7f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 points_num 
    float32 points_int
    float64 dist_num 
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new points_density(null);
    if (msg.points_num !== undefined) {
      resolved.points_num = msg.points_num;
    }
    else {
      resolved.points_num = 0
    }

    if (msg.points_int !== undefined) {
      resolved.points_int = msg.points_int;
    }
    else {
      resolved.points_int = 0.0
    }

    if (msg.dist_num !== undefined) {
      resolved.dist_num = msg.dist_num;
    }
    else {
      resolved.dist_num = 0.0
    }

    return resolved;
    }
};

module.exports = points_density;
