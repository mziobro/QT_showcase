import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4


import Assets 1.0

Item {
    width: Style.screenWidth
    height: Style.screenHeight

    RowLayout {
        spacing: 20
        anchors.centerIn: parent

        Column{
            CustomTextEdit{
                id: temperaturePicker
                name: "Temperature"
                text: "36.6"
            }
            CustomButton {
                text: "Save"
                onClicked: {
                    periodData.addRecord(temperaturePicker.setText)
                }
            }
        }
    }
}
