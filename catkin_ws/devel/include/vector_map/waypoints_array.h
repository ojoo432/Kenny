// Generated by gencpp from file vector_map/waypoints_array.msg
// DO NOT EDIT!


#ifndef VECTOR_MAP_MESSAGE_WAYPOINTS_ARRAY_H
#define VECTOR_MAP_MESSAGE_WAYPOINTS_ARRAY_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <vector_map/waypoint_publish.h>

namespace vector_map
{
template <class ContainerAllocator>
struct waypoints_array_
{
  typedef waypoints_array_<ContainerAllocator> Type;

  waypoints_array_()
    : waypoints()  {
    }
  waypoints_array_(const ContainerAllocator& _alloc)
    : waypoints(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::vector_map::waypoint_publish_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::vector_map::waypoint_publish_<ContainerAllocator> >::other >  _waypoints_type;
  _waypoints_type waypoints;





  typedef boost::shared_ptr< ::vector_map::waypoints_array_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::vector_map::waypoints_array_<ContainerAllocator> const> ConstPtr;

}; // struct waypoints_array_

typedef ::vector_map::waypoints_array_<std::allocator<void> > waypoints_array;

typedef boost::shared_ptr< ::vector_map::waypoints_array > waypoints_arrayPtr;
typedef boost::shared_ptr< ::vector_map::waypoints_array const> waypoints_arrayConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::vector_map::waypoints_array_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::vector_map::waypoints_array_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace vector_map

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'vector_map': ['/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::vector_map::waypoints_array_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vector_map::waypoints_array_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vector_map::waypoints_array_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vector_map::waypoints_array_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vector_map::waypoints_array_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vector_map::waypoints_array_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::vector_map::waypoints_array_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5dd85112a2219703725eb3991320c5ee";
  }

  static const char* value(const ::vector_map::waypoints_array_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5dd85112a2219703ULL;
  static const uint64_t static_value2 = 0x725eb3991320c5eeULL;
};

template<class ContainerAllocator>
struct DataType< ::vector_map::waypoints_array_<ContainerAllocator> >
{
  static const char* value()
  {
    return "vector_map/waypoints_array";
  }

  static const char* value(const ::vector_map::waypoints_array_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::vector_map::waypoints_array_<ContainerAllocator> >
{
  static const char* value()
  {
    return "waypoint_publish[] waypoints\n\
================================================================================\n\
MSG: vector_map/waypoint_publish\n\
int32 id\n\
int32 lane_id\n\
float32 x\n\
float32 y\n\
float32 z\n\
int32 point_id\n\
";
  }

  static const char* value(const ::vector_map::waypoints_array_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::vector_map::waypoints_array_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.waypoints);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct waypoints_array_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::vector_map::waypoints_array_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::vector_map::waypoints_array_<ContainerAllocator>& v)
  {
    s << indent << "waypoints[]" << std::endl;
    for (size_t i = 0; i < v.waypoints.size(); ++i)
    {
      s << indent << "  waypoints[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::vector_map::waypoint_publish_<ContainerAllocator> >::stream(s, indent + "    ", v.waypoints[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // VECTOR_MAP_MESSAGE_WAYPOINTS_ARRAY_H
