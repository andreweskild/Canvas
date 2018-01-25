import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Shapes 1.0
import styleplugin 1.0

Item {
    id: control
    implicitWidth: resizeHandle.x + resizeHandle.width
    implicitHeight: resizeHandle.y + resizeHandle.height

    property string title: "Hello World"
    property Component contentItem



    ShadowItem {
        anchors.fill: parent
        hidden: false
    }

    Rectangle {
        anchors.fill: parent
        radius: 4
        color: ColorPalette.window

        Shape {
            id: resizeHandle
            y: 400
            x: 200
            property int radius: 4
            width: 16
            height: 16
            ShapePath {
                fillColor: ColorPalette.raised
                strokeWidth: -1
                startX: resizeHandle.width; startY: 0
                PathLine { x: resizeHandle.width; y: resizeHandle.height - resizeHandle.radius; }
                PathArc { radiusX: 4; radiusY: 4;
                    x: resizeHandle.width - resizeHandle.radius; y: resizeHandle.height }
                PathLine { x: 0; y: resizeHandle.height }
                PathLine { x: resizeHandle.width; y: 0 }
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeFDiagCursor
                drag.target: resizeHandle
                drag.minimumX: 150
                drag.maximumX: 250
                drag.minimumY: 350
                drag.maximumY: 450
            }
        }
    }

    Item {
        id: titlebar
        height: 24
        width: parent.width
        clip: true
        Rectangle {
            width: parent.width
            height: parent.height + radius
            radius: 4
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

        MouseArea {
            id: dragArea
            anchors.fill: parent

            drag.target: control
        }


    }
    Item {
        height: parent.height - titlebar.height - 32
        width: parent.width - 16
        y: titlebar.height + 16
        x: 8
        Loader {
            anchors.fill: parent
            sourceComponent: contentItem
        }
    }

}
