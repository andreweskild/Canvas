import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import styleplugin 1.0
import components 1.0


ToolBox {
    id: tools


    title: "Tools"

    contentItem: ColumnLayout {
        id: content
        width: 140
        spacing: 15

        ToolGroup {
            Layout.fillWidth: true
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 10

            ColumnLayout{
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 5
                Label {
                    Layout.fillWidth: true
                    text: "Opacity"
                    color: ColorPalette.content
                }
                Slider {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
            ColumnLayout{
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 5
                Label {
                    Layout.fillWidth: true
                    text: "Thickness"
                    color: ColorPalette.content
                }
                Slider {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }

//        UndoRedoButton {
//            Layout.fillWidth: true
//            height: 30
//        }

        RowLayout {
            Layout.fillWidth: true

            Button {
                height: 30
                Layout.fillWidth: true
                text: "UNDO"
            }
            Button {
                height: 30
                Layout.fillWidth: true
                text: "REDO"
            }
        }
    }
}
