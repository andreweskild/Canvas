import QtQuick 2.10
import QtQuick.Controls 2.3
import styleplugin 1.0

SwipeDelegate {
            id: control
            width: 72
            height: 20

            property color color

            background: Item {
                height: parent.height
                width: parent.width

                ShadowItem {
                    anchors.fill: parent
                    hovered: control.hovered
                    hidden: control.pressed
                }

                InteractiveGradientItem {
                    id: background
                    anchors.fill: parent
                    primaryColor: control.pressed ? Qt.darker(control.color, 1.2) : control.color
                    secondaryColor: control.pressed ? Qt.lighter(control.color, 1.2) :
                                    control.hovered ? Qt.lighter(control.color, 1.2) : control.color

                    Behavior on primaryColor {
                        ColorAnimation {
                            duration: 100
                            easing {
                                type: Easing.InOutSine
                            }
                        }
                    }
                    Behavior on secondaryColor {
                        ColorAnimation {
                            duration: 100
                            easing {
                                type: Easing.InOutSine
                            }
                        }
                    }
                }
            }

            contentItem: Label {
                leftPadding: 10
                height: parent.height
                width: parent.width
                verticalAlignment: Text.AlignVCenter
                text: control.text
                font: control.font
                color: control.hovered ? ColorPalette.contentSecondary : ColorPalette.content
                Behavior on color {
                    ColorAnimation {
                        duration: 150
                        easing {
                            type: Easing.InOutSine
                        }
                    }
                }
            }

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
