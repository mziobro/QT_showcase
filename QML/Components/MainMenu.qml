import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0


import Assets 1.0


Item {
    id: root
    property string imagePath: "qrc:/Assets/Images/MainMenu/"
    width: Style.menuItemWidth
    height: 700
    signal menuItemClicked(string label)

    ListView {
        id: mainMenuListView
        model: MainMenuList {}
        anchors.fill: parent
        clip: true
        keyNavigationEnabled : false
        spacing: 5
        focus: false

        delegate: mainMenuDelegate

        Component{
            id: mainMenuDelegate
            Rectangle {
                id: delegateShape
                width: Style.menuItemWidth
                height: Style.menuItemHeight
                color: Style.componentColor
                radius: 10
                opacity: 0.7
                RowLayout {
                    anchors.fill: parent
                    Text    {
                        text: label
                        color: Style.textColor
                        font.pixelSize: Style.menuFontSize
                        Layout.preferredWidth: Style.menuItemTextWidth
                        Layout.leftMargin: 20
                    }
                    Image{
                        source: image
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled : true
                    onClicked: {
                        root.menuItemClicked(label)
                    }
                    onEntered: delegateShape.color = Qt.darker(Style.componentColor)
                    onExited:  delegateShape.color = Style.componentColor
                }

                Behavior on color { ColorAnimation { duration: Style.defaultAnimationTime }}
            }
        }
    }
}
