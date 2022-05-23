import QtQuick 2.2
import QtQuick.Window 2.1 //potreba pro otevreni okna
//lumberMill, farm, stables
import QtQuick.Dialogs 1.2 // pokud nebudou suroviny

Window{
    property int entityCount: 3
    property int entitySpacing: 20
    property int entityHeight: 120

    color: "lightgray"
    opacity: 100
    id: root
    width: 500
    height: (entityHeight * entityCount) + (entityCount+1) * entitySpacing + 100

    Rectangle {

        radius: 8
        color: "lightgray"
        border.width: 8
        border.color: "gray"

        Column {
            id: options
            width: 400
            height: 408
            spacing: entitySpacing
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 5
            anchors.verticalCenterOffset: 210
            anchors.horizontalCenterOffset: 260

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
                        name: "exited"
                        PropertyChanges{
                            target: builtIntButton1
                            border.color: "gray"
                        }
                    }


                ]

                Text {
                    id: text1
                    x: 125
                    y: 30
                    width: 230
                    height: 35
                    text: qsTr("Build lumber mill")
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
                    source: "images/lumberMill.png"
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: image4
                    x: 173
                    y: 63
                    width: 30
                    height: 41
                    source: "images/coins.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: text6
                    x: 125
                    y: 66
                    width: 47
                    height: 34
                    text: qsTr("100")
                    font.pixelSize: 22
                    horizontalAlignment: Text.AlignHCenter
                    scale: 1
                    font.weight: Font.Black
                    font.family: "Arial"
                }

                MessageDialog {
                    id:notEnoughResources
                    title: "Not enough resources"
                    text: "You need more resources to buy this building"
                    standardButtons: StandardButton.Ok
                    onAccepted: this.close()
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {

                        if(game.buyBuilding(100, 0) == true){
                        //pokud je dostatek zlata
                            var building = 4; //zde priradime hodnotu,
                            var fieldCount = game.getFieldCount(mapTile.tileIndex)
                            var coordinate = game.getCoordinates()

                            mapTile.state = "lumberMill"
                            mapTile.previousState = mapTile.state
                            //vytvorit prideleni k souradnicim setCoordinates
                            game.setFieldCount(coordinate, building)
                            game.payGolds(100)


                            close()//po provedeni se zavre okno

                        }
                        else {
                           notEnoughResources.open()
                        }


                    }

                    onEntered: {
                        builtIntButton1.state = "hovered"
                    }

                    onExited: {
                        builtIntButton1.state = "exited"

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
                    text: qsTr("Build farm")
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
                    source: "images/farm.png"
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
                    text: qsTr("80")
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
                    text: qsTr("120")
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
                            game.newWorkers(2)

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
                    text: qsTr("Build stables")
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
                    source: "images/stables.png"
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
                    text: qsTr("200")
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
                    text: qsTr("200")
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
                            game.newWorkers(5)
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
}

