import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window{
    id: root
    width: 300
    height: 100
    Rectangle {
        id: saveAs
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -20
        anchors.verticalCenter:parent.verticalCenter
        visible: true

        TextInput{
            id: saveAsText
            anchors.centerIn: parent
            text: "write a file name"
            font.pixelSize: 20
        }

        Rectangle {
            id: saveAsButton
            width: 150
            height: 50
            radius: 8

            color: "#faebd7"
            border.width: 8
            anchors.verticalCenterOffset: 45
            border.color: "gray"
            opacity: 100
            anchors.verticalCenter:parent.verticalCenter
            anchors.horizontalCenter:parent.horizontalCenter

            states: [
                State {
                    name: "hovered"
                    PropertyChanges{
                        target: saveAsButton
                        border.color: "dimgray"
                    }
                },
                State {
                    name: "exited"
                    PropertyChanges{
                        target: saveAsButton
                        border.color: "gray"
                    }
                }
            ]

            Text {
                id: text4
                anchors.centerIn: parent
                width: 102
                height: 34
                text: qsTr("Save As")
                font.pixelSize: 22
                font.weight: Font.Black
                font.family: "Arial"
                scale: 1

            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true

                onClicked:{
                    save.saveFileWName(saveAsText.text);
                    close()
                    //dodelat reakci na kliknuti
                }

                onEntered: {
                    saveAsButton.state = "hovered"
                }

                onExited: {
                    saveAsButton.state = "exited"
                }
            }
        }
    }

}
