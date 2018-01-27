import QtQuick 2.10
import styleplugin 1.0

// Provides the ability to drag-and-drop a toolbox onto a side of the window,
// as well as a container to hold the toolbox once it is dropped

DropArea {
    id: dragTarget
    implicitHeight: 10
    implicitWidth: 4
    keys: "toolbox"

    property bool readyToSnap: false

    Timer {
        interval: 500
        running: dragTarget.containsDrag
        repeat: false

        onTriggered: {
            dragTarget.readyToSnap = true;
        }
    }

    onExited: {
        if (readyToSnap)
        {
            readyToSnap = false;
        }
    }

    Rectangle {
        id: dropRect
        anchors.fill: parent
        color: ColorPalette.accent
        opacity: readyToSnap && dragTarget.containsDrag ? 1 : 0

        Behavior on opacity {
            NumberAnimation {
                duration: 150
                easing {
                    type: Easing.InOutSine
                }
            }
        }
    }

}
