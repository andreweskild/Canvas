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
        width: 148
        spacing: 16

        ToolGroup {
            Layout.fillWidth: true
        }

        RowLayout {
            Layout.fillWidth: true
            height: opacityDial.height + opacityLabel.padding + opacityLabel.height
            spacing: 12
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Dial {
                    id: opacityDial
                    width: 56
                    height: 56
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    Label {
                        id: opacityLabel
                        topPadding: 8
                        width: parent.width
                        anchors.top: parent.bottom
                        horizontalAlignment: Text.AlignHCenter
                        text: "Opacity"
                        color: ColorPalette.content
                    }
                }
            }
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Dial {
                    width: 56
                    height: 56
                    anchors.left: parent.left
                    anchors.leftMargin: 4
                    Label {
                        topPadding: 8
                        width: parent.width
                        anchors.top: parent.bottom
                        horizontalAlignment: Text.AlignHCenter
                        text: "Thickness"
                        color: ColorPalette.content
                    }
                }
            }

        }

        UndoRedoButton {
            Layout.fillWidth: true
            height: 32
        }
    }
}
