import QtQuick 2.0
import Assets 1.0


Item {
    id: root
    width: Style.screenWidth
    height: Style.screenHeight

    Text {
        anchors.centerIn: root
        text: "Currently nothing in here..."
        color: Style.textColor
        font.pixelSize: Style.menuFontSize
    }
}
