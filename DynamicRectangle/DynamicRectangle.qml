import QtQuick 2.14

Rectangle{
    width: 100
    height: 100
    color: "blue"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Dynamic Rect");
            parent.color = parent.color === "blue" ? "red" : "blue";
        }
    }
}
