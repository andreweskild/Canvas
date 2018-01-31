import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import styleplugin 1.0

Item {
    implicitWidth: 96
    implicitHeight: listView.height + 20

    ShadowItem {
        anchors.fill: parent
    }

    Rectangle {
        anchors.fill: parent
        color: ColorPalette.raised
        radius: 5
    }

    ListView {
        id: listView
        width: parent.width
        height: contentItem.height
        anchors.top: parent.top
        anchors.topMargin: 10
        clip: true
        model: ListModel {
            ListElement { sender: "LAYER 3"}
            ListElement { sender: "LAYER 2" }
            ListElement { sender: "LAYER 3"}
            ListElement { sender: "BACKGROUND" }
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
                    color: deleteLabel.SwipeDelegate.pressed ? Qt.darker("tomato", 1.1) : "tomato"
                }
            }
        }
    }
}
