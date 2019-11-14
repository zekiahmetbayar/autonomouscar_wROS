# Declare the version of the CMake API for forward-compatibility
cmake_minimum_required(VERSION 2.8)

# Declare the name of the CMake Project
project(examplelib)

find_package(catkin REQUIRED COMPONENTS roscpp rospy std_msgs genmsg)

#add_message_files(FILES)
#add_service_files(FILES)
#generate_messages(DEPENDENCIES std_msgs)

# Declare this project as a catkin package
catkin_package(
  INCLUDE_DIRS include
  LIBRARIES examplelib
  CATKIN_DEPENDS roscpp
)
set(CMAKE_CXX_FLAGS "-Wall")

# Add the headers from roscpp
include_directories(include ${roscpp_INCLUDE_DIRS})

# Define a library target called hello_world
add_library(examplelib
  src/examplesrc.cpp
)
target_link_libraries(examplelib ${roscpp_LIBRARIES})



