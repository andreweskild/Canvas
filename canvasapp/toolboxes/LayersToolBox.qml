import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import components 1.0

ToolBox {
    id: layers

    title: "Layers"

    contentItem: ColumnLayout {
        id: content
        width: 148
        spacing: 8

        RowLayout {
            Layout.fillWidth: true
            height: layerOpacitySlider.height
            spacing: 8

            Label {
                text: "Opacity"
            }

            Slider {
                id: layerOpacitySlider
                Layout.fillWidth: true
            }
        }

        LayersList {
            Layout.fillWidth: true
        }

        Button {
            text: "New Layer"
        }
    }

}
