import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import components 1.0
import styleplugin 1.0

ToolBox {
    id: colors

    title: "Colors"

    contentItem: ColumnLayout {
        id: content
        width: 140
        spacing: 10

        ColorSelectionControl {
            id: selectionControl
            Layout.fillWidth: true
            height: 110
        }


        RowLayout {
            Layout.fillWidth: true
            spacing: 5
            ColorPreviewButton {
                id: colorPreview
                height: 20
                width: 40
                color: selectionControl.colorSelection
            }
            TextField {
                Layout.fillWidth: true
                text: colorPreview.color
            }
        }
    }

}
