import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import styleplugin 1.0

Item {
    id: root
    height: 64
    width: 64
    property real hue
    readonly property color selectedColor: Qt.hsva(hue, draggableArea.saturation, draggableArea.value, 1.0)
    Item {
        anchors.fill: parent
        clip: true
        Rectangle {
            width: parent.width + 4
            height: parent.height
            radius: 4
            layer.enabled: true
        // Main Value and Saturation selection control
            layer.effect: ShaderEffect {
                property color hue: Qt.hsva(root.hue, 1.0, 1.0, 1.0)
                fragmentShader: "
                    uniform lowp sampler2D source;
                    varying highp vec2 qt_TexCoord0;
                    uniform highp vec4 hue;
                    uniform lowp float qt_Opacity;
                    void main() {
                        lowp vec4 p = texture2D(source, qt_TexCoord0);
                        highp float value = qt_TexCoord0.y;
                        highp float saturation = qt_TexCoord0.x;
                        highp vec4 greyColor = mix(vec4(1.0, 1.0, 1.0, 1.0), vec4(0.0, 0.0 ,0.0 ,1.0), value);
                        highp vec4 hueColor = mix(vec4(1.0, 1.0, 1.0, 1.0), hue, saturation);
                        gl_FragColor = greyColor * hueColor * p * qt_Opacity;
                    }"
            }
        }

    }

    MouseArea {
        id: draggableArea
        height: root.height + 12
        width: root.width + 12
        anchors.centerIn: root
        property real saturation: mouseArea.x / mouseArea.drag.maximumX
        property real value: 1.0 - mouseArea.y / mouseArea.drag.maximumY
        onMouseXChanged: {
            mouseArea.x = Math.max(Math.min(mouseArea.drag.maximumX, mouse.x - mouseArea.width * .5),
                                   mouseArea.drag.minimumX);
        }
        onMouseYChanged: {
            mouseArea.y = Math.max(Math.min(mouseArea.drag.maximumY, mouse.y - mouseArea.height * .5),
                                   mouseArea.drag.minimumY);
        }

        MouseArea {
            id: mouseArea
            height: 24
            width: 24

            drag.target: this
            drag.threshold: 0
            drag.minimumX: 0
            drag.maximumX: draggableArea.width - width

            drag.minimumY: 0
            drag.maximumY: draggableArea.height - height

            ShadowItem {
                anchors.fill: parent
                hovered: mouseArea.containsMouse
                hidden: mouseArea.pressed
            }

            Rectangle {
                anchors.fill: parent
                color: root.selectedColor
                radius: 12
                border.width: 3
                border.color: "white"
            }
        }
    }
}

