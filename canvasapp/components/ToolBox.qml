import QtQuick 2.10
import QtQuick.Controls 2.3
import styleplugin 1.0

Item {
    id: control
    width: 200
    height: 400

    property string title: "Hello World"

    ShadowItem {
        anchors.fill: parent
    }

    Rectangle {
        anchors.fill: parent
        radius: Dimensions.cornerRadius
        color: ColorPalette.window
    }

    Item {
        id: titlebar
        height: Dimensions.commonHeight
        width: parent.width
        clip: true
        Rectangle {
            width: parent.width
            height: parent.height + radius
            radius: Dimensions.cornerRadius
            color: ColorPalette.raised
        }
        Label {
            leftPadding: Dimensions.commonPadding
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
}
