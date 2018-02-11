import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import styleplugin 1.0
import components 1.0
import toolboxes 1.0

ApplicationWindow {
    id: window
    width: 1024
    height: 768
    visible: true
    title: qsTr("Hello World")
    color: "white"

            Item {
                width: parent.width
                height: 40

                Rectangle {
                    height: parent.height
                    width: parent.width
                    color: ColorPalette.sunkenDark
                    border.width: 1
                    border.color: Qt.darker(color, 1.2)
                }

                MenuBar {
                    anchors.fill: parent
                        Menu {
                            title: qsTr("Canvas")
                            Action { text: qsTr("About...") }
                            Action { text: qsTr("Help...") }
                            Action { text: qsTr("Settings...") }
                            MenuSeparator { }
                            Action {
                                text: qsTr("Quit")
                                onTriggered: {
                                    window.close();
                                }
                            }
                        }
                        Menu {
                            title: qsTr("File")
                            Action { text: qsTr("New...") }
                            Action { text: qsTr("Open...") }
                            Action { text: qsTr("Save") }
                            Action { text: qsTr("Save As...") }
                        }
                        Menu {
                            title: qsTr("Edit")
                            Action { text: qsTr("Cut") }
                            Action { text: qsTr("Copy") }
                            Action { text: qsTr("Paste") }
                        }
                    }

                RowLayout {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    spacing: 10
                    Button {
                        hoverEnabled: true
                        text: "Hide"
                        onClicked: {
                            window.showMinimized();
                        }
                    }
                    Button {
                        hoverEnabled: true
                        text: "Close"
                        onClicked: {
                            window.close();
                        }
                    }

        }
    }

    ToolsToolBox {
        y: 40
    }

    LayersToolBox {
        y: parent.height - height
    }


    ColorsToolBox {
        y: 40
        x: parent.width - width
    }

}
