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

        ColorSelectionSquare {
            Layout.fillHeight: true
            Layout.fillWidth: true
            hue: hueSlider.hue
        }

        HueSelectionSlider {
            id: hueSlider
            width: 24
            Layout.fillHeight: true
            z: -1
        }
    }

}
