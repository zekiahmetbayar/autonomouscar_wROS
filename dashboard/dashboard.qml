import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Window {
    id: root
    visible: true
    width: 512
    height: 512

    color: "#000000"
    title: "Dashboard"

    ValueSource {
        id: valueSource
        turnSignal: -1
        rpm: 0
    }

    function setText(integer)
    {
        speedometer.value = integer;
    }

    Item {
        id: container
        width: 512
        height: 512
        scale: 1
        opacity: 1
        clip: false
        visible: true
        anchors.centerIn: parent
        focus: true

        Row {
            id: gaugeRow
            width: 512
            height: 512
            spacing: container.width * 0.02
            anchors.centerIn: parent

            CircularGauge {
                id: speedometer
                maximumValue: 20
                width: 400
                height: 400
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                style: DashboardGaugeStyle {}
            }

        }
    }
}
