import QtQuick 2.10
import styleplugin 1.0


MouseArea {
    id: mouseArea
    implicitHeight: 20
    implicitWidth: 96

    transform: Translate {
        y: mouseArea.pressed ? 2 : 0


        Behavior on y {
            NumberAnimation {
                duration: 100
                easing {
                    type: Easing.InOutSine
                }
            }
        }
    }

    hoverEnabled: true
    GenericInteractiveRect {
        anchors.fill: parent
        hovered: mouseArea.containsMouse
        pressed: mouseArea.pressed
    }
}
