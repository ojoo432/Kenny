// Auto-generated. Do not edit!

// (in-package points_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let points_density = require('./points_density.js');

//-----------------------------------------------------------

class points_density_array {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.points_density_array = null;
    }
    else {
      if (initObj.hasOwnProperty('points_density_array')) {
        this.points_density_array = initObj.points_density_array
      }
      else {
        this.points_density_array = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type points_density_array
    // Serialize message field [points_density_array]
    // Serialize the length for message field [points_density_array]
    bufferOffset = _serializer.uint32(obj.points_density_array.length, buffer, bufferOffset);
    obj.points_density_array.forEach((val) => {
      bufferOffset = points_density.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type points_density_array
    let len;
    let data = new points_density_array(null);
    // Deserialize message field [points_density_array]
    // Deserialize array length for message field [points_density_array]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points_density_array = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points_density_array[i] = points_density.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.points_density_array.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'points_msgs/points_density_array';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b858f0c0e7e13b1ca36b528932bc5670';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    points_density[] points_density_array
    ================================================================================
    MSG: points_msgs/points_density
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
    const resolved = new points_density_array(null);
    if (msg.points_density_array !== undefined) {
      resolved.points_density_array = new Array(msg.points_density_array.length);
      for (let i = 0; i < resolved.points_density_array.length; ++i) {
        resolved.points_density_array[i] = points_density.Resolve(msg.points_density_array[i]);
      }
    }
    else {
      resolved.points_density_array = []
    }

    return resolved;
    }
};

module.exports = points_density_array;
