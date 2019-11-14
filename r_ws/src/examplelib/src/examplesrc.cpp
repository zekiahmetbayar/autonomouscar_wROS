
#include "examplelib/examplelib.h"
#include <cmath>

float Trig_DegreesToRadians(float degrees)
{
 return ( degrees * M_PI ) / 180.0;
}

float Trig_RadiansToDegrees(float radians)
{
  return ( radians * 180.0 ) / M_PI ;
}

float Trig_LimitRadians(float angle)
{
  while ( angle < -M_PI ) {
    angle += 2*M_PI;
  }
  while ( angle > M_PI ) {
    angle -= 2*M_PI;
  }
  return angle;
}

float Trig_LimitDegrees(float angle)
{
  while ( angle < -180 ) {
    angle += 360;
  }
  while ( angle > 180 ) {
    angle -= 360;
  }
  return angle;
}
