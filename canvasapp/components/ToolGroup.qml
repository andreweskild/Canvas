import QtQuick 2.10
import QtQuick.Controls 2.3
import styleplugin 1.0

Item {
    implicitWidth: 96
    implicitHeight: listView.height + 16

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
        anchors.verticalCenter: parent.verticalCenter
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
            height: 48


            swipe.right: Label {
                id: deleteLabel
                text: qsTr("Delete")
                color: "white"
                verticalAlignment: Label.AlignVCenter
                padding: 12
                height: parent.height
                anchors.right: parent.right

                SwipeDelegate.onClicked: listView.model.remove(index)

                background: Rectangle {
                    color: deleteLabel.SwipeDelegate.pressed ? Qt.darker("tomato", 1.1) : "tomato"
                }
            }
        }
    }
}
