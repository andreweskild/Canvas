import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import styleplugin 1.0
import components 1.0

ToolBox {
    id: layers

    title: "Layers"

    contentItem: ColumnLayout {
        id: content
        width: 140
        spacing: 10

        ColumnLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 5
            Label {
                Layout.fillWidth: true
                text: "Layer Opacity:"
                color: ColorPalette.content
            }
            Slider {
                Layout.fillWidth: true
                Layout.fillHeight: true
                value: 1
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
