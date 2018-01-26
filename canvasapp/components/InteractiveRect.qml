import QtQuick 2.10
import styleplugin 1.0


MouseArea {
    id: mouseArea
    implicitHeight: 24
    implicitWidth: 96

    hoverEnabled: true
    GenericInteractiveRect {
        anchors.fill: parent
        hovered: mouseArea.containsMouse
        pressed: mouseArea.pressed
    }
}
