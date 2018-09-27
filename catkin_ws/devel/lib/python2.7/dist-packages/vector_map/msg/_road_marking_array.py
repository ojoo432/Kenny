# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from vector_map/road_marking_array.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import vector_map.msg

class road_marking_array(genpy.Message):
  _md5sum = "3a7bb78ec80bc5c541892726df462d56"
  _type = "vector_map/road_marking_array"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """road_marking[] road_markings
================================================================================
MSG: vector_map/road_marking
int32 id
int32 lane_id
int32 category
int32 w_id"""
  __slots__ = ['road_markings']
  _slot_types = ['vector_map/road_marking[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       road_markings

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(road_marking_array, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.road_markings is None:
        self.road_markings = []
    else:
      self.road_markings = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.road_markings)
      buff.write(_struct_I.pack(length))
      for val1 in self.road_markings:
        _x = val1
        buff.write(_get_struct_4i().pack(_x.id, _x.lane_id, _x.category, _x.w_id))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.road_markings is None:
        self.road_markings = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.road_markings = []
      for i in range(0, length):
        val1 = vector_map.msg.road_marking()
        _x = val1
        start = end
        end += 16
        (_x.id, _x.lane_id, _x.category, _x.w_id,) = _get_struct_4i().unpack(str[start:end])
        self.road_markings.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.road_markings)
      buff.write(_struct_I.pack(length))
      for val1 in self.road_markings:
        _x = val1
        buff.write(_get_struct_4i().pack(_x.id, _x.lane_id, _x.category, _x.w_id))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.road_markings is None:
        self.road_markings = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.road_markings = []
      for i in range(0, length):
        val1 = vector_map.msg.road_marking()
        _x = val1
        start = end
        end += 16
        (_x.id, _x.lane_id, _x.category, _x.w_id,) = _get_struct_4i().unpack(str[start:end])
        self.road_markings.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4i = None
def _get_struct_4i():
    global _struct_4i
    if _struct_4i is None:
        _struct_4i = struct.Struct("<4i")
    return _struct_4i
