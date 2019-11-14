#!/usr/bin/env python
import sys
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import TwistStamped
from PySide2 import QtWidgets, QtCore

from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtCore import QObject,Signal, Property, QUrl, QStringListModel, Slot, QTimer

from PySide2.QtGui import *
from PySide2.QtQml import *
import random



class MyClass(QObject):
    #changeText = Signal(str)

    def __init__(self, parent=None):
        super(MyClass, self).__init__(parent)


app2 = QApplication(sys.argv)
my_obj = MyClass()

# timer = QTimer()
# timer.start(200)

engine = QQmlApplicationEngine()
ctx = engine.rootContext()
ctx.setContextProperty("my_obj", my_obj)
engine.load('dashboard.qml')
root = engine.rootObjects()[0]


def get_vel(message):
    print message.twist.linear
    root.setText(message.twist.linear.x)
    #rospy.loginfo("Current Z Coordinate %s", message)

#Listener Node
def listener():
    rospy.init_node('listenravmos', anonymous=True)

    rospy.Subscriber("/mavros/local_position/velocity_body", TwistStamped, get_vel)

    app2.exec_()
    rospy.spin()

if __name__ == '__main__':
    listener()
