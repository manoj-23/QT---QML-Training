import QtQuick 2.0

Item {
    width: 300
    height: 300

    Rectangle {
        id: myRectangle   // Assign an ID to the Rectangle
        width: 150
        height: 150
        color: "green"
        radius: 75  // Use this property for rounded corners
        anchors.centerIn: parent

        MouseArea {
            anchors.fill: parent
            onClicked: {
                radiusAnimation.start();
                colorAnimation.start();
            }
        }

        // PropertyAnimation to animate the radius (rounded corners)
        PropertyAnimation {
            id: radiusAnimation
            target: myRectangle   // Target the Rectangle
            property: "radius"    // Animate the radius property of the Rectangle
            from: 75
            to: 220
            duration: 5000
        }

        // ColorAnimation to animate the color of the Rectangle
        ColorAnimation {
            id: colorAnimation
            target: myRectangle   // Target the Rectangle
            property: "color"     // Animate the color property
            from: "green"
            to: "blue"
            duration: 500
        }
    }
}
