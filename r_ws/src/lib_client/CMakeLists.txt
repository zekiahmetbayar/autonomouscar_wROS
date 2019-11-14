# %Tag(FULLTEXT)%
cmake_minimum_required(VERSION 2.8.3)
project(lib_client)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  genmsg
  examplelib
)

catkin_package(
  CATKIN_DEPENDS message_runtime
)

include_directories(
  src/
  ${catkin_INCLUDE_DIRS}
  ${examplelib_INCLUDE_DIRS}
  ${roscpp_INCLUDE_DIRS}
)
set(CMAKE_CXX_FLAGS "-Wall")

add_executable(lib_client
    src/lib_client.cpp
)
target_link_libraries(lib_client ${catkin_LIBRARIES} ${examplelib_LIBRARIES})

# %EndTag(FULLTEXT)%
