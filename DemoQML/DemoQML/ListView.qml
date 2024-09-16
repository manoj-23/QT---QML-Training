import QtQuick 2.14
import QtQuick.Controls 2.14

ApplicationWindow {
    visible: true
    width: 400
    height: 300

    ListView {
        id: listView
        width: 400
        height: 300
        model: ListModel {
            ListElement { name: "Item 1" }
            ListElement { name: "Item 2" }
            ListElement { name: "Item 3" }
            ListElement { name: "Item 4" }
            ListElement { name: "Item 5" }
            ListElement { name: "Item 6" }
            ListElement { name: "Item 7" }
            ListElement { name: "Item 8" }
            ListElement { name: "Item 9" }
            ListElement { name: "Item 10" }
        }
        delegate: Item {
            width: listView.width
            height: 40

            Rectangle {
                width: parent.width
                height: 40
                color: "lightgrey"
                border.color: "grey"
                radius: 5

                Text {
                    anchors.centerIn: parent
                    text: model.name
                }
            }
        }

        // WheelHandler to scroll through the list items
        WheelHandler {
            id: scrollHandler
            target: listView
            onWheel: {
                var delta = event.angleDelta.y;
                listView.contentY += delta / 10; // Adjust scroll sensitivity
            }
        }
    }
}
