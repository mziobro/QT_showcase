import QtQuick 2.9
import QtQuick.Controls 2.12

import Assets 1.0

Item{
    id: root
    width: 200
    height: 120
    property string text: ""
    property string name: ""
    property string setText: textEdit.text

    Text {
        id: textName
        text: root.name
        color: Style.textColor
        font.pixelSize: 20
        anchors.top: root.top
        anchors.horizontalCenter: root.horizontalCenter
    }

    Rectangle{
        id: rect
        width: Style.buttonWidth
        height: 70
        color: Style.componentColor
        radius: 20
        anchors.horizontalCenter: root.horizontalCenter
        anchors.top: textName.bottom
        anchors.topMargin: 10

        TextInput  {
            id: textEdit
            text: root.text
            anchors.fill: rect
            horizontalAlignment : TextInput.AlignHCenter
            verticalAlignment : TextInput.AlignVCenter
            cursorVisible: false
            color: Style.textColor
            font {
                bold: false
                pixelSize: Style.buttonFontSize
            }
            selectByMouse: true
        }
    }
}
