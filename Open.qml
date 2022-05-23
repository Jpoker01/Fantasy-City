import QtQuick 2.2
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
Window{
    id: root
    width: 300
    height: 500
    color: "#dcded4"
    Column{
        x: 58
        visible: true
        anchors.verticalCenter: parent.verticalCenter
        smooth: true
        transformOrigin: Item.Center
        anchors.verticalCenterOffset: -12
        anchors.horizontalCenterOffset: -12

        anchors.horizontalCenter: parent.horizontalCenter
        Repeater{
                id: openRepeater
                model: save.numberOfSaves()  //save.getAllSaveFiles()
                Rectangle {
                    id: openButton
                    width: 150
                    height: 50
                    radius: 8

                    color: "#faebd7"
                    border.width: 8
                    border.color: "gray"
                    opacity: 100

                    states: [
                        State {
                            name: "hovered"
                            PropertyChanges{
                                target: openButton
                                border.color: "dimgray"
                            }
                        },
                        State {
                            name: "exited"
                            PropertyChanges{
                                target: openButton
                                border.color: "gray"
                            }
                        }
                    ]

                    Text {
                        id: openTextd
                        anchors.centerIn: parent
                        anchors.horizontalCenterOffset: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 150
                        height: 34
                        text: qsTr(save.getSaveFile(index))
                        font.pixelSize: 22
                        font.weight: Font.Black
                        font.family: "Arial"
                        scale: 1

                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked:{
                            game.loadGame(openTextd.text);
                            close()
                            //dodelat reakci na kliknuti
                        }

                        onEntered: {
                            openButton.state = "hovered"
                        }

                        onExited: {
                            openButton.state = "exited"
                        }
                    }
                }
            }
        }
    }
