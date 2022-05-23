import QtQuick 2.0
import QtQuick.Window 2.15
Window{
    id: root
    width: 550
    height: 270
    Rectangle {
        id: about
        anchors.horizontalCenterOffset: -25
        anchors.verticalCenterOffset: -40
        anchors.verticalCenter:parent.verticalCenter
        anchors.horizontalCenter:parent.horizontalCenter
        visible: true

        Text{
            id: aboutFantasyText
            anchors.verticalCenterOffset: -80
            anchors.verticalCenter:parent.verticalCenter
            anchors.horizontalCenter:parent.horizontalCenter
            text: "Fantasy City"
            font.pixelSize: 26
            color: "darkblue"
        }

        Text{
            id: aboutText
            anchors.centerIn: parent
            text: "
                 The goal of the game is to build up a city.
                 In order to build your city you need a number of resources.
                 Namely wood, gold and workers. You can assign workers into
                 certain buildings to make them produce resources.

                 The game was made by Michael Konečný, Jiří Pokorný and Vojtěch Mahdal"
            font.pixelSize: 15
        }

        Rectangle {
            id: returnButton
            width: 200
            height: 65
            radius: 8

            color: "#faebd7"
            border.width: 8
            anchors.verticalCenterOffset: 120
            border.color: "gray"
            opacity: 100
            anchors.verticalCenter:parent.verticalCenter
            anchors.horizontalCenter:parent.horizontalCenter

            states: [
                State {
                    name: "hovered"
                    PropertyChanges{
                        target: returnButton
                        border.color: "dimgray"
                    }
                },
                State {
                    name: "exited"
                    PropertyChanges{
                        target: returnButton
                        border.color: "gray"
                    }
                }
            ]

            Text {
                id: text4
                anchors.horizontalCenterOffset: 20
                anchors.verticalCenter:parent.verticalCenter
                anchors.horizontalCenter:parent.horizontalCenter
                width: 102
                height: 34
                text: qsTr("Return")
                font.pixelSize: 22
                font.weight: Font.Black
                font.family: "Arial"
                scale: 1

                Image {
                    id: image1
                    x: -58
                    y: -8
                    width: 48
                    height: 45
                    source: "images/back-arrow.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true

                onClicked:{
                    close()
                    //dodelat reakci na kliknuti
                }

                onEntered: {
                    returnButton.state = "hovered"
                }

                onExited: {
                    returnButton.state = "exited"
                }
            }
        }
    }

}
