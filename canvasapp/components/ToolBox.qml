import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.3
import QtQuick.Shapes 1.0
import styleplugin 1.0

Item {
    id: control
    // width calculated by content width + left and right padding
    width: loader.status === Loader.Null ? 120 : loader.width + 16
    // height calculated by content + titlebar + titlebar padding + bottom padding
    height: loader.status === Loader.Null ? 256 :
        (snapped ? parent.height : loader.height + titlebar.height + loader.anchors.topMargin + 12)

    Behavior on x { SmoothedAnimation { velocity: 2000 } }
    Behavior on y { SmoothedAnimation { velocity: 2000 } }
    Behavior on height { SmoothedAnimation { velocity: 2000 } }

    property string title: "Hello World"

    property Component contentItem

    property bool snapped: false

    onSnappedChanged: {
        if(snapped) {
            y = 0;
            x = 0;
        }
    }

    Drag.active: titlebar.drag.active
    Drag.keys: "toolbox"

    Drag.onActiveChanged: {
        if(Drag.active) {
            snapped = false;
        }
    }

    ShadowItem {
        anchors.fill: parent
        hidden: snapped
    }

    Rectangle {
        id: background
        anchors.fill: parent
        radius: snapped ? 0 : 4
        color: ColorPalette.window
    }

    MouseArea {
        id: titlebar
        drag.target: control
        drag.minimumX: 0
        drag.minimumY: 0

        drag.maximumX: Window.width - control.width
        drag.maximumY: Window.height - control.height
        height: 24
        width: parent.width
        onReleased: control.snapped = control.Drag.target !== null ? control.Drag.target.readyToSnap
                                                                   : false


        clip: true

        Rectangle {
            width: parent.width
            height: parent.height + radius
            radius: snapped ? 0 : 4
            color: ColorPalette.raised
        }
        Label {
            leftPadding: 8
            anchors.fill: parent
            text: control.title
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            color: ColorPalette.content
        }
    }

        Loader {
            id: loader
            anchors.topMargin: 12
            anchors.top: titlebar.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            sourceComponent: contentItem
        }

}
