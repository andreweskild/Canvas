import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import styleplugin 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Component.onCompleted: {
        ColorPalette.dark = false;
    }

}
