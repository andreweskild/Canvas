import QtQuick 2.10
import QtQuick.Controls 2.2
import styleplugin 1.0


Item {
    id: root
    width: 24
    height: 72
    readonly property real hue: slider.value
    Slider {
        id: slider
        height: parent.height + 16
        width: parent.width
        y: -8
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
                radius: 4
                color: Qt.hsva(root.hue, 1.0, 1.0, 1.0)
                border.width: 3
                border.color: "white"
            }

        }

        background:Item {
            height: parent.height - 16
            width: parent.width
            y: 8
            clip: true
            Rectangle {
                width: parent.width + 4
                height: parent.height
                x: -4
                radius: 4
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
