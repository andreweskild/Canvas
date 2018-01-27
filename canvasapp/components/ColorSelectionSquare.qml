import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item {
    height: 64
    width: 64


    RowLayout {
        anchors.fill: parent
        spacing: 0

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true
            Rectangle {
                width: parent.width + 4
                height: parent.height
                radius: 4
                layer.enabled: true
            // Main Value and Saturation selection control
                layer.effect: ShaderEffect {
                    property color hue: "green"
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

        Item {
            width: 24
            Layout.fillHeight: true
//            clip: true

            Slider {
                anchors.fill: parent
                orientation: Qt.Vertical
            }

//            Rectangle {
//                width: parent.width + 4
//                height: parent.height
//                x: -4
//                radius: 4
//            }


//            MouseArea {
//                width: parent.width
//                height: parent.width
//                drag.target: this
//                drag.axis: Drag.YAxis
//                drag.minimumY: 0
//                drag.maximumY: parent.height - height
//                Rectangle {
//                    id: hueSlider
//                    height: parent.height
//                    width: parent.width
//                    radius: 4
//                    color: "red"
//                }
//            }
        }
    }

}
