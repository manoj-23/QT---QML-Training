import QtQuick 2.0

Rectangle {
    width: 200
    height: 300

    ListModel {
        id: contactModel
        ListElement { name: "John Doe"; age: 30 }
        ListElement { name: "Jane Smith"; age: 25 }
        ListElement { name: "Alice Johnson"; age: 28 }
    }

    ListView {
        anchors.fill: parent
        model: contactModel
        delegate: Text {
            text: name + ", Age: " + age
            font.pixelSize: 14

        }
    }
}
