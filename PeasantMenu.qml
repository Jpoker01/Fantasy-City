import QtQuick 2.2
import QtQuick.Window 2.15

Window{
    property int entityCount: 2
    property int entitySpacing: 20

    property var coord: game.getCoordinates()
    property int working: game.getWorking(coord)


    id: root
    color: "lightgray"
    opacity: 100
    width: 500
    height: 600

    Rectangle {
          id: peasantInterface
          radius: 8
          color: "lightgray"
          border.width: 8
          border.color: "gray"

    Rectangle {
        id: peasantState
        y: 53
        width: 400
        height: 250
        radius: 8

        color: "#faebd7"
        border.width: 8
        anchors.horizontalCenterOffset: 249
        border.color: "gray"
        opacity: 100
        anchors.horizontalCenter:parent.horizontalCenter

        Text {
            id: peasantAssignment
            x: 17
            y: 14
            width: 367
            height: 0
            text: qsTr("Peasant assignment to the building")
            font.pixelSize: 18
            font.weight: Font.Black
            font.family: "Arial"
        }

        Rectangle {
            id: plusButton
            x: 307
            y: 65
            width: 40
            height: 38
            color: "#d3d3d3"
            radius: 4
            border.color: "#808080"
            border.width: 4

            states: [
                State {
                    name: "hovered"
                    PropertyChanges{
                        target: plusButton
                        border.color: "dimgray"
                    }
                },
                State {
                    name: "exited"
                    PropertyChanges{
                        target: plusButton
                        border.color: "gray"
                    }
                }
            ]

            Image {
                id: plusImage
                x: -2
                y: -5
                width: 45
                height: 49
                source: "images/plus.png"
                fillMode: Image.PreserveAspectFit
            }


            MouseArea{
                anchors.fill: parent
                hoverEnabled: true

                onClicked:{
                    var fieldCount = game.getFieldCount(mapTile.tileIndex)             
                    var coordinate = game.getCoordinates()
                    game.getToWork(coordinate)

                    peasantsAssigned.text = game.getWorking(coordinate)//getWorking

                     productionText.text = qsTr("Production: ") + game.getNewGolds(coordinate) + (" ") + game.getNewWoods(coordinate)

                    if((game.getWorking(game.getCoordinates()) > 0) && (game.getFieldCount(game.getCoordinates()) == 10)){
                        mapTile.state = "mine-used"
                        game.setFieldCount(game.getCoordinates(), 11)
                    }
                }

                onEntered: {
                    plusButton.state = "hovered"
                }

                onExited: {
                    plusButton.state = "exited"
                }
            }
        }

        Rectangle {
            id: minusButton
            x: 307
            y: 154
            width: 40
            height: 38
            color: "#d3d3d3"
            radius: 4
            border.color: "#808080"
            border.width: 4

            states: [
                State {
                    name: "hovered"
                    PropertyChanges{
                        target: minusButton
                        border.color: "dimgray"
                    }
                },
                State {
                    name: "exited"
                    PropertyChanges{
                        target: minusButton
                        border.color: "gray"
                    }
                }
            ]

            Image {
                id: minusImage
                x: 7
                y: -17
                width: 27
                height: 72
                source: "images/minus.png"
                scale: 1
                fillMode: Image.PreserveAspectFit
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true

                onClicked:{

                    var coordinate = game.getCoordinates()
                    game.removeWorkers(coordinate)

                    peasantsAssigned.text = game.getWorking(coordinate)//getWorking
                    productionText.text = qsTr("Production: ") + game.getNewGolds(coordinate) + (" ") + game.getNewWoods(coordinate)



                    if((game.getWorking(game.getCoordinates()) == 0) && (game.getFieldCount(game.getCoordinates()) == 11)){
                        mapTile.state = "mine-unused"
                        game.setFieldCount(game.getCoordinates(), 10)
                    }

                }

                onEntered: {
                    minusButton.state = "hovered"
                }

                onExited: {
                    minusButton.state = "exited"
                }
            }
        }

        Rectangle {
            id: rectangle3
            x: 34
            y: 65
            width: 245
            height: 127
            color: "#d3d3d3"
            radius: 4
            border.color: "#808080"
            border.width: 4

            Text {
                id: peasantsAssigned //zde se bude ukazovat soucasny pocet delniku prirazenych k budove
                x: 132
                y: 41
                text: working
                font.pixelSize: 32
                font.bold: true
            }

            Image {
                id: workerImage
                x: 17
                y: 14
                width: 100
                height: 100
                opacity: 1
                source: "images/worker.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: peasantMaximum //neupravovat
                x: 158
                y: 41
                text: qsTr("/ 5")
                font.pixelSize: 32
                font.bold: true
            }
        }

    }

    Rectangle {
        id: production
        x: 49
        y: 338
        width: 400
        height: 111

        radius: 8
        color: "#faebd7"
        border.width: 8
        border.color: "gray"

        Text {
            id: productionText
            x: 136
            y: 15
            width: 128
            height: 37
            text: qsTr("Production: ") + game.getNewGolds(game.getCoordinates()) + (" ") + game.getNewWoods(game.getCoordinates())
            font.pixelSize: 22
            font.family: "Arial"
            font.weight: Font.Black
        }

    }

    Rectangle {
        id: returnButton
        y: 484
        width: 200
        height: 65
        radius: 8

        color: "#faebd7"
        border.width: 8
        anchors.horizontalCenterOffset: 255
        border.color: "gray"
        opacity: 100
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

