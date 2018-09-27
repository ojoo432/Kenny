// Auto-generated. Do not edit!

// (in-package msgs.msg)


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
      this.points_count = null;
      this.dist_num = null;
    }
    else {
      if (initObj.hasOwnProperty('points_count')) {
        this.points_count = initObj.points_count
      }
      else {
        this.points_count = 0;
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
    // Serialize message field [points_count]
    bufferOffset = _serializer.int32(obj.points_count, buffer, bufferOffset);
    // Serialize message field [dist_num]
    bufferOffset = _serializer.float64(obj.dist_num, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type points_density
    let len;
    let data = new points_density(null);
    // Deserialize message field [points_count]
    data.points_count = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dist_num]
    data.dist_num = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs/points_density';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '89fea7ea0e73827d3f5c4993ca4032d2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 points_count
    float64 dist_num
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new points_density(null);
    if (msg.points_count !== undefined) {
      resolved.points_count = msg.points_count;
    }
    else {
      resolved.points_count = 0
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
