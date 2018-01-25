import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import styleplugin 1.0
import components 1.0

ApplicationWindow {
    width: 1024
    height: 768
    visible: true
    title: qsTr("Hello World")
    color: "white"

    Component.onCompleted: {
        ColorPalette.dark = true;
    }

    ToolBox {
        id: tools
        x: 20
        y: 20

        title: "Tools"

        contentItem: ColumnLayout {
            anchors.fill: parent
            spacing: 12

            ToolGroup {
                Layout.fillWidth: true
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Dial {
                    width: 64
                    height: 64
                }
                Dial {
                    width: 64
                    height: 64
                }
            }
        }
    }

}
