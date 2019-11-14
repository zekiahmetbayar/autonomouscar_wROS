
#include <ros/ros.h>
#include <examplelib/examplelib.h>

/* ======================================================= */
/* ======================================================= */
int main (int argc, char **argv)
{
  ros::init(argc, argv, "lib_client");

  
  ROS_INFO("%f radians = %f degrees", 1.0, Trig_RadiansToDegrees(1.0));
  ROS_INFO("%f degrees = %f radians", 1.0, Trig_DegreesToRadians(1.0));
  
  return 0;
}

