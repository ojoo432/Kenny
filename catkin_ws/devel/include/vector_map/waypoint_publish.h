// Generated by gencpp from file vector_map/waypoint_publish.msg
// DO NOT EDIT!


#ifndef VECTOR_MAP_MESSAGE_WAYPOINT_PUBLISH_H
#define VECTOR_MAP_MESSAGE_WAYPOINT_PUBLISH_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace vector_map
{
template <class ContainerAllocator>
struct waypoint_publish_
{
  typedef waypoint_publish_<ContainerAllocator> Type;

  waypoint_publish_()
    : id(0)
    , lane_id(0)
    , x(0.0)
    , y(0.0)
    , z(0.0)
    , point_id(0)  {
    }
  waypoint_publish_(const ContainerAllocator& _alloc)
    : id(0)
    , lane_id(0)
    , x(0.0)
    , y(0.0)
    , z(0.0)
    , point_id(0)  {
  (void)_alloc;
    }



   typedef int32_t _id_type;
  _id_type id;

   typedef int32_t _lane_id_type;
  _lane_id_type lane_id;

   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _z_type;
  _z_type z;

   typedef int32_t _point_id_type;
  _point_id_type point_id;





  typedef boost::shared_ptr< ::vector_map::waypoint_publish_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::vector_map::waypoint_publish_<ContainerAllocator> const> ConstPtr;

}; // struct waypoint_publish_

typedef ::vector_map::waypoint_publish_<std::allocator<void> > waypoint_publish;

typedef boost::shared_ptr< ::vector_map::waypoint_publish > waypoint_publishPtr;
typedef boost::shared_ptr< ::vector_map::waypoint_publish const> waypoint_publishConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::vector_map::waypoint_publish_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::vector_map::waypoint_publish_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace vector_map

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'vector_map': ['/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/vector_map/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::vector_map::waypoint_publish_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vector_map::waypoint_publish_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vector_map::waypoint_publish_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vector_map::waypoint_publish_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vector_map::waypoint_publish_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vector_map::waypoint_publish_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::vector_map::waypoint_publish_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b8de86b3a311006a3fa718fe285ae80e";
  }

  static const char* value(const ::vector_map::waypoint_publish_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb8de86b3a311006aULL;
  static const uint64_t static_value2 = 0x3fa718fe285ae80eULL;
};

template<class ContainerAllocator>
struct DataType< ::vector_map::waypoint_publish_<ContainerAllocator> >
{
  static const char* value()
  {
    return "vector_map/waypoint_publish";
  }

  static const char* value(const ::vector_map::waypoint_publish_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::vector_map::waypoint_publish_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 id\n\
int32 lane_id\n\
float32 x\n\
float32 y\n\
float32 z\n\
int32 point_id\n\
";
  }

  static const char* value(const ::vector_map::waypoint_publish_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::vector_map::waypoint_publish_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.lane_id);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.point_id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct waypoint_publish_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::vector_map::waypoint_publish_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::vector_map::waypoint_publish_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.id);
    s << indent << "lane_id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.lane_id);
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<float>::stream(s, indent + "  ", v.z);
    s << indent << "point_id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.point_id);
  }
};

} // namespace message_operations
} // namespace ros

#endif // VECTOR_MAP_MESSAGE_WAYPOINT_PUBLISH_H
