import QtQuick 2.10
import QtQuick.Controls 2.10
import com.example 1.0  // Import the C++ class we registered

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("C++ and QML Interfacing")

    Counter {
        id: counter
    }

    Column {
        spacing: 10
        anchors.centerIn: parent

        Text {
            text: "Counter Value: " + counter.value
            font.pixelSize: 20
        }

        Row {
            Button {
                text: "+"
                onClicked: counter.increment()
            }
            Button {
                text: "-"
                onClicked: counter.decrement()
            }
        }
    }
}
