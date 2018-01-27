import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import components 1.0

ToolBox {
    id: colors

    title: "Colors"

    contentItem: ColumnLayout {
        id: content
        width: 148
        spacing: 8

        ColorSelectionSquare {
            Layout.fillWidth: true
            height: 128
        }
    }

}
