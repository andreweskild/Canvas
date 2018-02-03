import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import styleplugin 1.0

Item {
    implicitWidth: 95
    implicitHeight: listView.height + miscTools.height + 20

    ShadowItem {
        anchors.fill: parent
    }

    Rectangle {
        anchors.fill: parent
        color: ColorPalette.raised
        radius: 4
    }

    ListView {
        id: listView
        width: parent.width
        height: contentItem.height
        anchors.top: parent.top
        anchors.topMargin: 10
        interactive: false
        clip: true
        model: ListModel {
            ListElement { sender: "PENCIL"}
            ListElement { sender: "PEN" }
            ListElement { sender: "MARKER"}
            ListElement { sender: "PAINT" }
            ListElement { sender: "ERASER" }
            ListElement { sender: "SMUDGER" }
        }



        delegate: SwipeDelegate {
            id: swipeDelegate
            text: model.sender
            width: parent.width
            height: 30


            swipe.right: Label {
                id: deleteLabel
                text: qsTr("Delete")
                color: "white"
                verticalAlignment: Label.AlignVCenter
                padding: 10
                height: parent.height
                anchors.right: parent.right

                SwipeDelegate.onClicked: listView.model.remove(index)

                background: Rectangle {
                    color: deleteLabel.SwipeDelegate.pressed ? Qt.darker("tomato", 1.1) : ColorPalette.sunken
                }
            }
        }
    }

    RowLayout {
        id: miscTools
        height: 30
        width: listView.width
        anchors.top: listView.bottom
        spacing: 0

        InteractiveRect {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        InteractiveRect {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        InteractiveRect {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        InteractiveRect {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
