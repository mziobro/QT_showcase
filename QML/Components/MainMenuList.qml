import QtQuick 2.0

ListModel {
    id: mainMenuModel

    ListElement {
        label: "Add note"
        image: "qrc:/Assets/Images/MainMenu/AddNote.png"
    }
    ListElement {
        label: "Charts"
        image: "qrc:/Assets/Images/MainMenu/Charts.png"
    }
    ListElement {
        label: "Settings"
        image: "qrc:/Assets/Images/MainMenu/Settings.png"
    }
}
