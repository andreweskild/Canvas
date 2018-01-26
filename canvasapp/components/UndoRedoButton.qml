import QtQuick 2.10
import QtQuick.Controls 2.3
import styleplugin 1.0

Item {
    height: 24
    width: 96

    ShadowItem {
        anchors.fill: parent
        hovered: undoMouseArea.containsMouse && !undoMouseArea.pressed ||
                 redoMouseArea.containsMouse && !redoMouseArea.pressed

    }

    Item {
        anchors.left: parent.left
        height: parent.height
        width: parent.width / 2
        clip: true
        transform: Translate {
            y: undoMouseArea.pressed ? 2 : 0


            Behavior on y {
                NumberAnimation {
                    duration: 100
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }
        MouseArea {
            id: undoMouseArea
            anchors.fill: parent
            hoverEnabled: true
            GenericInteractiveRounded {
                anchors.left: parent.left
                height: parent.height
                width: parent.width + 4
                hovered: undoMouseArea.containsMouse
                pressed: undoMouseArea.pressed
            }
            Text {
                anchors.centerIn: parent
                color: undoMouseArea.containsMouse ? ColorPalette.contentSecondary :
                                                     ColorPalette.content
                text: "UNDO"
            }
        }

    }
    Item {
        anchors.right: parent.right
        height: parent.height
        width: parent.width / 2
        clip: true
        transform: Translate {
            y: redoMouseArea.pressed ? 2 : 0


            Behavior on y {
                NumberAnimation {
                    duration: 100
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }
        MouseArea {
            id: redoMouseArea
            anchors.fill: parent
            hoverEnabled: true
            GenericInteractiveRounded {
                anchors.right: parent.right
                height: parent.height
                width: parent.width + 4
                hovered: redoMouseArea.containsMouse
                pressed: redoMouseArea.pressed
            }
            Text {
                anchors.centerIn: parent
                text: "REDO"
                color: undoMouseArea.containsMouse ? ColorPalette.contentSecondary :
                                                     ColorPalette.content
            }
        }
    }
}
