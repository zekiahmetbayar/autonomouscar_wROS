#!/bin/bash

gnome-terminal --tab -- roslaunch mavros px4.launch fcu_url:="udp://:14540@127.0.0.1:14557"

gnome-terminal --tab -- rosrun getmavros listenstate.py

gnome-terminal --tab --working-directory=/path/ -e './QGroundControl.AppImage'

gnome-terminal --tab --working-directory=/path/python-uinput/examples -e 'sudo python joystick.py'

cd ~/Firmware && make px4_sitl gazebo_rover







