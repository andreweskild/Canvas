import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.3
import QtQuick.Shapes 1.0
import styleplugin 1.0

Item {
    id: control
    // width calculated by content width + left and right padding
    width: loader.status === Loader.Null ? 120 : loader.width + 20
    // height calculated by content + titlebar + titlebar padding + bottom padding
    height: loader.status === Loader.Null ? 256 :
        loader.height + titlebar.height + loader.anchors.topMargin + 15

    Behavior on x { SmoothedAnimation { velocity: 2000 } }
    Behavior on y { SmoothedAnimation { velocity: 2000 } }
    Behavior on height { SmoothedAnimation { velocity: 2000 } }

    property string title: "Hello World"

    property Component contentItem

    Drag.active: titlebar.drag.active


    ShadowItem {
        anchors.fill: parent
    }

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 5
        color: ColorPalette.window
    }

    MouseArea {
        id: titlebar
        drag.target: control
        drag.minimumX: 0
        drag.minimumY: 0

        drag.maximumX: Window.width - control.width
        drag.maximumY: Window.height - control.height
        drag.threshold: 0
        height: 20
        width: parent.width
        cursorShape: pressed ? Qt.ClosedHandCursor : Qt.OpenHandCursor


        clip: true

        Rectangle {
            width: parent.width
            height: parent.height + radius
            radius: 5
            color: ColorPalette.raised
        }
        Label {
            leftPadding: 10
            anchors.fill: parent
            text: control.title
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            color: ColorPalette.content
        }
    }

    Loader {
        id: loader
        anchors.topMargin: 15
        anchors.top: titlebar.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        sourceComponent: contentItem
    }

}
