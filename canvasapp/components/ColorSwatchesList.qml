import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import styleplugin 1.0

Item {
    implicitWidth: 96
    implicitHeight: listView.height + paletteDropdown.height

//    ShadowItem {
//        anchors.fill: parent
//    }

    Rectangle {
        width: parent.width
        height: parent.height - 10
        y: 10
        color: ColorPalette.sunken
        radius: 4
        border.color: Qt.darker(color, 1.1)
        border.width: 1
    }

    ListView {
        id: listView
        width: parent.width
        height: contentItem.height
        y: paletteDropdown.height
        clip: true
        spacing: 10


        model: ListModel {
            ListElement { sender: "#fa0596"}
            ListElement { sender: "#ff2424" }
            ListElement { sender: "#09f8c9"}
            ListElement { sender: "#dc90d2" }
        }


        header: Item {
            height: 10
            width: parent.width
        }

        footer: Item {
            height: 10
            width: parent.width
        }


        delegate: ColorSwatchItem {
            id: swipeDelegate
            color: model.sender
            width: parent.width - padding * 2
            x: padding
            height: 30
            padding: 5
        }
    }

    MouseArea {
        id: paletteDropdown
        width: parent.width
        height: 20
        clip: true
        onClicked: menu.open()
        hoverEnabled: true

        GenericInteractiveRounded {
            height: parent.height + 4
            width: parent.width
            hovered: parent.containsMouse && !menu.isOpen
            pressed: parent.pressed
            Label {
                height: paletteDropdown.height
                width: paletteDropdown.width
                verticalAlignment: Text.AlignVCenter
                text: "Current Palette"
                leftPadding: 10
                color: paletteDropdown.containsMouse && !menu.isOpen || parent.pressed
                       ? ColorPalette.contentSecondary : ColorPalette.content
                Behavior on color {
                    ColorAnimation {
                        duration: 150
                        easing {
                            type: Easing.InOutSine
                        }
                    }
                }
            }
        }



        Menu {
            id: menu
            y: paletteDropdown.height
            width: parent.width


            MenuItem {
                width: parent.width
                text: "My Palette"
            }
            MenuItem {
                width: parent.width
                text: "Default Palette"
            }
            MenuSeparator {}
            MenuItem {
                width: parent.width
                text: "New Palette"
            }
        }
    }
}
