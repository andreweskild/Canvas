import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import styleplugin 1.0
import components 1.0
import toolboxes 1.0

ApplicationWindow {
    width: 1024
    height: 768
    visible: true
    title: qsTr("Hello World")
    color: "white"

    Component.onCompleted: {
        ColorPalette.dark = true;
    }

    ToolBoxSnapBox {
        height: parent.height
        anchors.left: parent.left
    }

    ToolsToolBox {

    }

    LayersToolBox {
        y: parent.height - height
    }

}
