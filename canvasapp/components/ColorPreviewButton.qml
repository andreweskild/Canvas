import QtQuick 2.10
import styleplugin 1.0

Item {
    id: root
    height: 20
    width: 72
    z: 10
    property color color

    Rectangle {
        anchors.fill: parent
        color: ColorPalette.sunken
        radius: 4
    }

    MouseArea {
        id: mouseArea
        height: parent.height
        width: parent.width
        hoverEnabled: true
        cursorShape: pressed ? Qt.ClosedHandCursor : Qt.OpenHandCursor
        drag.threshold: 0
        Drag.active: pressed
        drag.target: this
        onReleased: {
            x = 0;
            y = 0;
        }


        Behavior on x { SmoothedAnimation { duration: 100 } }
        Behavior on y { SmoothedAnimation { duration: 100 } }


        ShadowItem {
            anchors.fill: parent
            hovered: mouseArea.containsMouse
        }

        Rectangle {
            anchors.fill: parent
            color: root.color
            radius: 4
        }
    }
}
