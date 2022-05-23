import QtQuick 2.0
import QtQuick.Window 2.15

Window{
    property int entityCount: 3
    property int entitySpacing: 20
    property int entityHeight: 120

    color: "lightgray"
    opacity: 100
    id: root
    width: 500
    height: (entityHeight * entityCount) + (entityCount+1) * entitySpacing + 100

    Column {
        id: options
        x: 158
        y: 106
        width: 412
        height: 366
        spacing: entitySpacing
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 5
        anchors.verticalCenterOffset: -62
        anchors.horizontalCenterOffset: 0

        Rectangle {
            id: builtIntButton1
            width: 400
            height: entityHeight
            radius: 8

            color: "#faebd7"
            border.width: 8
            border.color: "gray"
            opacity: 100
            anchors.horizontalCenter:parent.horizontalCenter

            states: [
                State {
                    name: "hovered"
                    PropertyChanges{
                        target: builtIntButton1
                        border.color: "dimgray"
                    }
                },
                State {
                    name: "exit"
                    PropertyChanges{
                        target: builtIntButton1
                        border.color: "gray"
                    }
                }


            ]

            Text {
                id: text1
                x: 126
                y: 23
                width: 230
                height: 35
                text: qsTr("Castle lvl 1")
                font.pixelSize: 22
                font.weight: Font.Black
                font.family: "Arial"
            }

            Image {
                id: image
                x: 19
                y: 10
                width: 100
                height: 100
                source: "images/castle_lvl1.png"
                fillMode: Image.PreserveAspectFit
            }
            /*
                MessageDialog{
                    id:notEnoughResources
                    title: "Not enough resources"
                    text: "You need more resources to buy this building"
                    standardButtons: StandardButton.Ok
                    onAccepted: this.close()
                }
                */

            Rectangle {
                id: castleInterface
                x: 124
                y: 62

                radius: 8

                width: 194
                height: 35
                color: "#d3d3d3"
                border.color: "#808080"
                border.width: 4

                Text {
                    id: text5
                    x: 8
                    y: 4
                    text: qsTr("Current lvl")
                    font.pixelSize: 22
                    font.bold: false
                }

            }
        }

        Rectangle {
            id: builtIntButton2
            width: 400
            height: entityHeight
            radius: 8

            color: "#faebd7"
            border.width: 8
            border.color: "gray"
            opacity: 100
            anchors.horizontalCenter:parent.horizontalCenter

            states: [
                State {
                    name: "hovered"
                    PropertyChanges{
                        target: builtIntButton2
                        border.color: "dimgray"
                    }
                },
                State {
                    name: "exit"
                    PropertyChanges{
                        target: builtIntButton2
                        border.color: "gray"
                    }
                }
            ]


            Text {
                id: text2
                x: 128
                y: 27
                width: 232
                height: 34
                text: qsTr("Castle lvl 2")
                font.pixelSize: 22
                font.weight: Font.Black
                font.family: "Arial"
                scale: 1
            }

            Image {
                id: image2
                x: 22
                y: 10
                width: 100
                height: 100
                source: "images/castle_lvl2.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: image5
                x: 176
                y: 67
                width: 30
                height: 41
                source: "images/coins.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text7
                x: 128
                y: 68
                width: 47
                height: 34
                text: qsTr("500")
                elide: Text.ElideNone
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.NoWrap
                scale: 1
                font.weight: Font.Black
                font.family: "Arial"
            }

            Image {
                id: image7
                x: 285
                y: 62
                width: 42
                height: 48
                source: "images/wood.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text9
                x: 232
                y: 68
                width: 47
                height: 34
                text: qsTr("750")
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                scale: 1
                font.weight: Font.Black
                font.family: "Arial"
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true

                onClicked:{


                    if(game.buyBuilding(80, 120) == true){
                        //pokud je dostatek zlata
                        var building = 5;
                        var fieldCount = game.getFieldCount(mapTile.tileIndex)
                        var coordinate = game.getCoordinates()

                        mapTile.state = "farm"
                        mapTile.previousState = mapTile.state

                        game.setFieldCount(coordinate, building)
                        game.payGolds(80)
                        game.payWoods(120)

                        close()//po provedeni se zavre okno

                    }
                    else {
                        notEnoughResources.open()
                    }


                }

                onEntered: {
                    builtIntButton2.state = "hovered"
                }

                onExited: {
                    builtIntButton2.state = "exited"

                }

            }

            Rectangle {
                id: castleInterface1
                x: 126
                y: 61
                width: 194
                height: 35
                visible: false
                color: "#d3d3d3"
                radius: 8
                border.color: "#808080"
                border.width: 4
                Text {
                    id: text6
                    x: 8
                    y: 4
                    text: qsTr("Current lvl")
                    font.pixelSize: 22
                    font.bold: false
                }
            }
        }

        Rectangle {
            id: builtIntButton3
            width: 400
            height: entityHeight
            radius: 8

            color: "#faebd7"
            border.width: 8
            border.color: "gray"
            opacity: 100
            anchors.horizontalCenter:parent.horizontalCenter

            states: [
                State {
                    name: "hovered"
                    PropertyChanges{
                        target: builtIntButton3
                        border.color: "dimgray"
                    }
                },
                State {
                    name: "exit"
                    PropertyChanges{
                        target: builtIntButton3
                        border.color: "gray"
                    }
                }
            ]

            Text {
                id: text3
                x: 125
                y: 27
                width: 232
                height: 34
                text: qsTr("Castle lvl3")
                font.pixelSize: 22
                font.weight: Font.Black
                font.family: "Arial"
                scale: 1
            }

            Image {
                id: image3
                x: 19
                y: 10
                width: 100
                height: 100
                source: "images/castle_lvl3.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: image6
                x: 176
                y: 67
                width: 30
                height: 41
                source: "images/coins.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text8
                x: 128
                y: 68
                width: 47
                height: 34
                text: qsTr("1000")
                elide: Text.ElideNone
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.NoWrap
                scale: 1
                font.weight: Font.Black
                font.family: "Arial"
            }

            Image {
                id: image8
                x: 285
                y: 62
                width: 42
                height: 48
                source: "images/wood.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text10
                x: 232
                y: 68
                width: 47
                height: 34
                text: qsTr("1500")
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                scale: 1
                font.weight: Font.Black
                font.family: "Arial"
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true

                onClicked:{



                    if(game.buyBuilding(200, 200) == true){
                        //pokud je dostatek zlata
                        var building = 6; //zde priradime hodnotu,
                        var fieldCount = game.getFieldCount(mapTile.tileIndex)
                        var coordinate = game.getCoordinates()

                        mapTile.state = "stables"
                        mapTile.previousState = mapTile.state
                        //vytvorit prideleni k souradnicim setCoordinates
                        game.setFieldCount(coordinate, building)
                        game.payGolds(200)
                        game.payWoods(200)

                        close()//po provedeni se zavre okno

                    }
                    else {
                        notEnoughResources.open()
                    }

                }

                onEntered: {
                    builtIntButton3.state = "hovered"
                }

                onExited: {
                    builtIntButton3.state = "exited"

                }
            }

            Rectangle {
                id: castleInterface2
                x: 126
                y: 64
                width: 194
                height: 35
                visible: false
                color: "#d3d3d3"
                radius: 8
                border.color: "#808080"
                border.width: 4
                Text {
                    id: text11
                    x: 8
                    y: 4
                    text: qsTr("Current lvl")
                    font.pixelSize: 22
                    font.bold: false
                }
            }
        }

        Rectangle {
            id: builtIntButton4
            width: 200
            height: 65
            radius: 8

            color: "#faebd7"
            border.width: 8
            border.color: "gray"
            opacity: 100
            anchors.horizontalCenter:parent.horizontalCenter

            states: [
                State {
                    name: "hovered"
                    PropertyChanges{
                        target: builtIntButton4
                        border.color: "dimgray"
                    }
                },
                State {
                    name: "exit"
                    PropertyChanges{
                        target: builtIntButton4
                        border.color: "gray"
                    }
                }
            ]

            Text {
                id: text4
                x: 71
                y: 16
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
                    builtIntButton4.state = "hovered"
                }

                onExited: {
                    builtIntButton4.state = "exited"
                }
            }
        }
    }
}

