// Auto-generated. Do not edit!

// (in-package vector_map.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let road_marking = require('./road_marking.js');

//-----------------------------------------------------------

class road_marking_array {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.road_markings = null;
    }
    else {
      if (initObj.hasOwnProperty('road_markings')) {
        this.road_markings = initObj.road_markings
      }
      else {
        this.road_markings = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type road_marking_array
    // Serialize message field [road_markings]
    // Serialize the length for message field [road_markings]
    bufferOffset = _serializer.uint32(obj.road_markings.length, buffer, bufferOffset);
    obj.road_markings.forEach((val) => {
      bufferOffset = road_marking.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type road_marking_array
    let len;
    let data = new road_marking_array(null);
    // Deserialize message field [road_markings]
    // Deserialize array length for message field [road_markings]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.road_markings = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.road_markings[i] = road_marking.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.road_markings.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vector_map/road_marking_array';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3a7bb78ec80bc5c541892726df462d56';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    road_marking[] road_markings
    ================================================================================
    MSG: vector_map/road_marking
    int32 id
    int32 lane_id
    int32 category
    int32 w_id
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new road_marking_array(null);
    if (msg.road_markings !== undefined) {
      resolved.road_markings = new Array(msg.road_markings.length);
      for (let i = 0; i < resolved.road_markings.length; ++i) {
        resolved.road_markings[i] = road_marking.Resolve(msg.road_markings[i]);
      }
    }
    else {
      resolved.road_markings = []
    }

    return resolved;
    }
};

module.exports = road_marking_array;
