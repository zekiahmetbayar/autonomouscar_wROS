/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Window {
    id: root
    visible: true
    width: 1024
    height: 600

    color: "#696969"
    title: "Qt Quick Extras Demo"

    ValueSource {
        id: valueSource
        turnSignal: -1
        rpm: 0
    }

    // Dashboards are typically in a landscape orientation, so we need to ensure
    // our height is never greater than our width.
    Item {
        id: container
        width: 1024
        height: Math.min(root.width, root.height)
        scale: 1
        transformOrigin: Item.Left
        opacity: 1
        clip: false
        visible: true
        property var ct : 0
        property var ctr : 0
        property var ctrl : 0
        property var ctrlr : 0
        anchors.centerIn: parent
        focus: true
        Keys.onPressed: {
            if (event.key === Qt.Key_A ) {
                ct++
                if(ct % 2 !== 0){
                    leftIndicator.on = true;
                }
                else{
                    leftIndicator.on = false;
                }
            }
            else if(event.key === Qt.Key_D ) {
                ctr++
                if(ctr % 2 !== 0){
                    rightIndicator.on = true;
                }
                else{
                    rightIndicator.on = false;
                }
            }
            else if(event.key === Qt.Key_W ) {
                ctrl++
                console.log(container.ctrl / 40)

            }
            else if(event.key === Qt.Key_S ) {
                ctrl--
                console.log(ctrl)

            }
            else if(event.key === Qt.Key_E ) {
                ctrlr++
                if(ctrlr % 2 !== 0){
                    rightIndicator.on = true;
                    leftIndicator.on = true;
                }
                else{
                    rightIndicator.on = false;
                    leftIndicator.on = false;
                }

            }

        }

        //        MouseArea {
        //                anchors.fill: parent
        //                onClicked: rightIndicator.on = true
        //                acceptedButtons: Qt.LeftButton
        //            }
        //        MouseArea {
        //                anchors.fill: parent
        //                onClicked: rightIndicator.on = false
        //                acceptedButtons: Qt.RightButton
        //            }

        Row {
            id: gaugeRow
            width: 764
            height: 300
            anchors.verticalCenterOffset: -43
            anchors.horizontalCenterOffset: 0
            spacing: container.width * 0.02
            anchors.centerIn: parent

            TurnIndicator {
                id: leftIndicator
                x: 500
                anchors.verticalCenter: parent.verticalCenter
                width: height
                height: container.height * 0.1 - gaugeRow.spacing
                on: false

                direction: Qt.LeftArrow
            }

            CircularGauge {
                id: speedometer
                value: container.ctrl
                anchors.verticalCenter: parent.verticalCenter
                maximumValue: 280
                // We set the width to the height, because the height will always be
                // the more limited factor. Also, all circular controls letterbox
                // their contents to ensure that they remain circular. However, we
                // don't want to extra space on the left and right of our gauges,
                // because they're laid out horizontally, and that would create
                // large horizontal gaps between gauges on wide screens.
                width: height
                height: container.height * 0.5
                anchors.verticalCenterOffset: 0

                style: DashboardGaugeStyle {}
            }

            CircularGauge {
                id: tachometer
                width: 300
                height: 300
                maximumValue: 7
                value: container.ctrl / 40
                anchors.verticalCenter: parent.verticalCenter

                style: TachometerStyle {}
            }

            TurnIndicator {
                id: rightIndicator
                anchors.verticalCenter: parent.verticalCenter
                width: height
                height: container.height * 0.1 - gaugeRow.spacing
                enabled: true
                direction: 5
                on: false
                flashing: false

            }

        }

        Row {
            id: row1
            width: 390
            height: 183
            anchors.top: parent.top
            anchors.topMargin: 466
            anchors.left: parent.left
            anchors.leftMargin: 311
            spacing: 11


            CircularGauge {
                id: fuelGauge
                width: 200
                height: 128
                value: valueSource.fuel
                maximumValue: 1

                style: IconGaugeStyle {
                    id: fuelGaugeStyle

                    icon: "qrc:/images/fuel-icon.png"
                    minWarningColor: Qt.rgba(0.5, 0, 0, 1)

                    tickmarkLabel: Text {
                        color: "white"
                        visible: styleData.value === 0 || styleData.value === 1
                        font.pixelSize: fuelGaugeStyle.toPixels(0.225)
                        text: styleData.value === 0 ? "E" : (styleData.value === 1 ? "F" : "")
                    }
                }
            }

            CircularGauge {
                width: 200
                height: 128.1
                anchors.left: parent.left
                anchors.leftMargin: 175
                value: valueSource.temperature
                maximumValue: 2

                style: IconGaugeStyle {
                    id: tempGaugeStyle

                    icon: "qrc:/images/temperature-icon.png"
                    maxWarningColor: Qt.rgba(0.5, 0, 0, 1)

                    tickmarkLabel: Text {
                        color: "white"
                        visible: styleData.value === 0 || styleData.value === 1
                        font.pixelSize: tempGaugeStyle.toPixels(0.225)
                        text: styleData.value === 0 ? "C" : (styleData.value === 1 ? "H" : "")
                    }
                }
            }
        }
    }
}

