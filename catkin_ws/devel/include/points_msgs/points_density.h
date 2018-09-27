// Generated by gencpp from file points_msgs/points_density.msg
// DO NOT EDIT!


#ifndef POINTS_MSGS_MESSAGE_POINTS_DENSITY_H
#define POINTS_MSGS_MESSAGE_POINTS_DENSITY_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace points_msgs
{
template <class ContainerAllocator>
struct points_density_
{
  typedef points_density_<ContainerAllocator> Type;

  points_density_()
    : points_num(0)
    , points_int(0.0)
    , dist_num(0.0)  {
    }
  points_density_(const ContainerAllocator& _alloc)
    : points_num(0)
    , points_int(0.0)
    , dist_num(0.0)  {
  (void)_alloc;
    }



   typedef int32_t _points_num_type;
  _points_num_type points_num;

   typedef float _points_int_type;
  _points_int_type points_int;

   typedef double _dist_num_type;
  _dist_num_type dist_num;





  typedef boost::shared_ptr< ::points_msgs::points_density_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::points_msgs::points_density_<ContainerAllocator> const> ConstPtr;

}; // struct points_density_

typedef ::points_msgs::points_density_<std::allocator<void> > points_density;

typedef boost::shared_ptr< ::points_msgs::points_density > points_densityPtr;
typedef boost::shared_ptr< ::points_msgs::points_density const> points_densityConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::points_msgs::points_density_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::points_msgs::points_density_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace points_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'points_msgs': ['/home/ee904-i5-old-pc-1/Desktop/Kenny/catkin_ws/src/points_msgs/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::points_msgs::points_density_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::points_msgs::points_density_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::points_msgs::points_density_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::points_msgs::points_density_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::points_msgs::points_density_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::points_msgs::points_density_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::points_msgs::points_density_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7c990c22312891c33f02a93bc686cb7f";
  }

  static const char* value(const ::points_msgs::points_density_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7c990c22312891c3ULL;
  static const uint64_t static_value2 = 0x3f02a93bc686cb7fULL;
};

template<class ContainerAllocator>
struct DataType< ::points_msgs::points_density_<ContainerAllocator> >
{
  static const char* value()
  {
    return "points_msgs/points_density";
  }

  static const char* value(const ::points_msgs::points_density_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::points_msgs::points_density_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 points_num \n\
float32 points_int\n\
float64 dist_num \n\
";
  }

  static const char* value(const ::points_msgs::points_density_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::points_msgs::points_density_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.points_num);
      stream.next(m.points_int);
      stream.next(m.dist_num);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct points_density_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::points_msgs::points_density_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::points_msgs::points_density_<ContainerAllocator>& v)
  {
    s << indent << "points_num: ";
    Printer<int32_t>::stream(s, indent + "  ", v.points_num);
    s << indent << "points_int: ";
    Printer<float>::stream(s, indent + "  ", v.points_int);
    s << indent << "dist_num: ";
    Printer<double>::stream(s, indent + "  ", v.dist_num);
  }
};

} // namespace message_operations
} // namespace ros

#endif // POINTS_MSGS_MESSAGE_POINTS_DENSITY_H