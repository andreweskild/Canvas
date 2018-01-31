import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import styleplugin 1.0

Item {
    height: 64
    width: 64

    property color colorSelection: Qt.hsva(colorSelector.hue, colorSelector.saturation,
                                           colorSelector.value, 1.0)

    RowLayout {
        anchors.fill: parent
        spacing: 10

        ColorSelectionSquare {
            id: colorSelector
            Layout.fillHeight: true
            Layout.fillWidth: true
            hue: hueSlider.hue
        }

        HueSelectionSlider {
            id: hueSlider
            width: 20
            Layout.fillHeight: true
            z: -1
        }
    }

}
