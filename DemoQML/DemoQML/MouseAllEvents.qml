// MouseEventsAllInOne.qml
import QtQuick 2.14
import QtQuick.Controls 2.14

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "All Mouse Events Example"

    Rectangle {
        id: rect
        width: 150
        height: 150
        color: "blue"
        anchors.centerIn: parent
        border.color: "black"
        border.width: 2

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                rect.color = rect.color === "blue" ? "green" : "blue"; // Toggle color on click
                console.log("Mouse clicked at:", mouse.x, mouse.y);
            }

            onPressed: {
                console.log("Mouse pressed at:", mouseArea.x, mouseArea.y);
            }

            onReleased: {
                console.log("Mouse released at:", mouseArea.x, mouseArea.y);
            }

            onPositionChanged: {
                console.log("Mouse moved to:", mouseArea.x, mouseArea.y);
            }

            onDoubleClicked: {
                console.log("Mouse double-clicked at:", mouseArea.x, mouseArea.y);
            }

            onPressAndHold: {
                console.log("Mouse pressed and held at:", mouseArea.x, mouseArea.y);
            }
        }
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Click, double-click, or move the mouse over the rectangle."
        font.pixelSize: 16
        padding: 10
    }
}
