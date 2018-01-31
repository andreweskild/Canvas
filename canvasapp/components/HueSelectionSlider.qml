import QtQuick 2.10
import QtQuick.Controls 2.2
import styleplugin 1.0


Item {
    id: root
    width: 20
    height: 72
    readonly property real hue: slider.value
    Slider {
        id: slider
        height: parent.height + 10
        width: parent.width
        y: -5
        from: 1.0
        to: 0.0
        orientation: Qt.Vertical
        handle: Item {
            id: handleBG
            x: slider.orientation === Qt.Vertical ? 0 :
                   parent.visualPosition * parent
            y: slider.orientation === Qt.Vertical ? parent.visualPosition * (parent.availableHeight - height) :
                                             0
            height: slider.orientation === Qt.Vertical ? parent.width : parent.height
            width: slider.orientation === Qt.Vertical ? parent.width : parent.height
            transform: Translate {
                y: slider.pressed ? 2 : 0


                Behavior on y {
                    NumberAnimation {
                        duration: 100
                        easing {
                            type: Easing.InOutSine
                        }
                    }
                }
            }

            ShadowItem {
                anchors.fill: parent
                hidden: slider.pressed
                hovered: slider.hovered
            }

            Rectangle {
                id: background
                anchors.fill: parent
                radius: 5
                color: Qt.hsva(root.hue, 1.0, 1.0, 1.0)
                border.width: 3
                border.color: slider.pressed ? "white" :
                    slider.hovered ? ColorPalette.accent : "white"
                Behavior on border.color {
                    ColorAnimation {
                        duration: 150
                        easing {
                            type: Easing.InOutSine
                        }
                    }
                }
            }

        }

        background:Item {
            height: parent.height - 10
            width: 10
            anchors.horizontalCenter: parent.horizontalCenter
            y: 5
            Rectangle {
                anchors.fill: parent
                radius: 5
                gradient: Gradient {
                    GradientStop {
                       position: 0.000
                       color: Qt.rgba(1, 0, 0, 1)
                    }
                    GradientStop {
                       position: 0.167
                       color: Qt.rgba(1, 1, 0, 1)
                    }
                    GradientStop {
                       position: 0.333
                       color: Qt.rgba(0, 1, 0, 1)
                    }
                    GradientStop {
                       position: 0.500
                       color: Qt.rgba(0, 1, 1, 1)
                    }
                    GradientStop {
                       position: 0.667
                       color: Qt.rgba(0, 0, 1, 1)
                    }
                    GradientStop {
                       position: 0.833
                       color: Qt.rgba(1, 0, 1, 1)
                    }
                    GradientStop {
                       position: 1.000
                       color: Qt.rgba(1, 0, 0, 1)
                    }
                  }
            }
        }
    }
}
