import QtQuick 2.14
import QtQuick.Controls 2.14

ApplicationWindow {
    visible: true
    width: 400
    height: 200
    title: "Complex Property Example"

    // Custom property to hold the progress value
    property int progressValue: 0

    // Alias property to expose the color of the progress bar
    property alias progressColor: progressBar.color

    // Property that changes color based on progressValue
    property color barColor: {
        if (progressValue < 30) return "red";
        if (progressValue < 70) return "orange";
        return "green";
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Progress: " + progressValue + "%"
            font.pointSize: 16
            color: "black"
        }

        Rectangle {
            id: progressBar
            width: parent.width * 0.8
            height: 30
            radius: 10
            color: barColor
            border.color: "black"
            border.width: 2

            Rectangle {
                id: fill
                width: progressValue * parent.width / 100
                height: parent.height
                color: "lightgrey"
                radius: 10
            }
        }

        Slider {
            width: parent.width * 0.8
            from: 0
            to: 100
            value: progressValue
            onValueChanged: progressValue = value
        }
    }
}
