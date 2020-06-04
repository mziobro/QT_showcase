import QtQuick 2.12
import Assets 1.0
import QtQuick.Layouts 1.12



Item {
    id: root
    width: Style.screenWidth
    height: Style.screenHeight
    signal menuItemClicked(string label)

    ColumnLayout {
        width: Style.screenWidth
        height: Style.screenHeight * 2/3
        anchors.centerIn: root
        Text{
            text: "26"
            color: Style.textColor
            font {
                pixelSize: 100
                bold: true
            }
            Layout.alignment: Qt.AlignCenter
        }

        MainMenu {
            onMenuItemClicked: {
                root.menuItemClicked(label)
            }
            Layout.alignment: Qt.AlignCenter
        }
    }
}
