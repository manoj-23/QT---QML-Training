import QtQuick 2.0

Item {
    width: 300
    height: 200

    Rectangle {
        width: 200
        height: 100
        color: "lightblue"
        anchors.centerIn: parent

        Text {
            text: "Hello, QtQuick!"
            anchors.centerIn: parent
            font.pixelSize: 20
        }
    }
}
