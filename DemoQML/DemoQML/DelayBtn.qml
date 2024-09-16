import QtQuick 2.10
import QtQuick.Controls 2.10

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: qsTr("Delay Button Example")

    DelayButton {
        id: delayButton
        anchors.centerIn: parent
        delay: 2000

        onClicked: {
            console.log("Button clicked after delay!")
        }
    }
}
