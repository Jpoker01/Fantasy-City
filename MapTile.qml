import QtQuick 2.2
import QtQuick.Window 2.15


Rectangle{
    //property alias zde
    property string previousState: ""
    property alias tileIndex: label.text
    property int workingWorkers


    id: mapTile
    width: 137
    height: 92
    radius: 6
    color: "transparent"
    border.width: 5
    border.color: "transparent"
    opacity: 0


   /* MessageDialog{
        id:cannotBuild
        title: "You can not build here"
        text: "You can build only on grass"
        standardButtons: StandardButton.Ok
        onAccepted: this.close()
    }*/
    states: [
        State {
            name: "hovered"
            PropertyChanges {
                target: mapTile
                color: "white"
                opacity: 0.1

            }
        },
        State {
            name: "exited"
            PropertyChanges {
                target: mapTile
                opacity: 0

            }
        },

        State {
            name: "castlelvl1"
            when: (game.getFieldCount(tileIndex) == 1)
            PropertyChanges {
                target: castlelvl1
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 100
            }
        },
        State {
            name: "castlelvl1_hovered"
            when: (game.getFieldCount(tileIndex) == 1)
            PropertyChanges {
                target: castlelvl1
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 0.5
            }
            PropertyChanges {
                target: label
                opacity: 0
            }
        },
        State {
            name: "castlelvl2"
            when: (game.getFieldCount(tileIndex) == 2)
            PropertyChanges {
                target: castlelvl2
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 100
            }
        },
        State {
            name: "castlelvl2_hovered"
            when: (game.getFieldCount(tileIndex) == 2)
            PropertyChanges {
                target: castlelvl2
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 0.5
            }
            PropertyChanges {
                target: label
                opacity: 0
            }
        },
        State {
            name: "castlelvl3"
            when: (game.getFieldCount(tileIndex) == 3)
            PropertyChanges {
                target: castlelvl3
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 100
            }
        },
        State {
            name: "castlelvl3_hovered"
            when: (game.getFieldCount(tileIndex) == 3)
            PropertyChanges {
                target: castlelvl3
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 0.5
            }
            PropertyChanges {
                target: label
                opacity: 0
            }
        },
        State {
            name: "lumberMill"
            when: (game.getFieldCount(tileIndex) == 4)
            PropertyChanges {
                target: lumberMill
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 100
            }
        },
        State {
            name: "lumberMill_hovered"
            when: (game.getFieldCount(tileIndex) == 4)
            PropertyChanges {
                target: lumberMill
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 0.5
            }
            PropertyChanges {
                target: label
                opacity: 0
            }
        },
        State {
            name: "farm"
            when: (game.getFieldCount(tileIndex) == 5)
            PropertyChanges {
                target: farm
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 100
            }
        },
        State {
            name: "farm_hovered"
            when: (game.getFieldCount(tileIndex) == 5)
            PropertyChanges {
                target: farm
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 0.5
            }
            PropertyChanges {
                target: label
                opacity: 0
            }
        },
        State {
            name: "mine-unused"
            when: (game.getFieldCount(tileIndex) == 10)
            PropertyChanges {
                target: mineunused
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 100
            }
        },
        State {
            name: "mine-unused_hovered"
            when: (game.getFieldCount(tileIndex) == 10)
            PropertyChanges {
                target: mineunused
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 0.5
            }
            PropertyChanges {
                target: label
                opacity: 0
            }
        },
        State {
            name: "mine-used"
            when: (game.getFieldCount(tileIndex) == 11)
            PropertyChanges {
                target: mineused
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 100
            }
        },
        State {
            name: "mine-used_hovered"
            when: (game.getFieldCount(tileIndex) == 11)
            PropertyChanges {
                target: mineused
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 0.5
            }
            PropertyChanges {
                target: label
                opacity: 0
            }
        },
        State {
            name: "stables"
            when: (game.getFieldCount(tileIndex) == 6)
            PropertyChanges {
                target: stables
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 100
            }
        },
        State {
            name: "stables_hovered"
            when: (game.getFieldCount(tileIndex) == 6)
            PropertyChanges {
                target: stables
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 0.5
            }
            PropertyChanges {
                target: label
                opacity: 0
            }
        },
        State {
            name: "building-construction"
            when: (game.getFieldCount(tileIndex) == 20)
            PropertyChanges {
                target: buildingConstruction
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 100
            }
        },
        State {
            name: "building-construction_hovered"
            when: (game.getFieldCount(tileIndex) == 20)
            PropertyChanges {
                target: buildingConstruction
                opacity: 100
            }
            PropertyChanges {
                target: mapTile
                opacity: 0.5
            }
            PropertyChanges {
                target: label
                opacity: 0
            }
        }
    ]

    Image {
        id: castlelvl1
        source: "images/castle_lvl1.png"
        opacity: 0
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

    }

    Image {
        id: castlelvl2
        source: "images/castle_lvl2.png"
        opacity: 0
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

    }

    Image {
        id: castlelvl3
        source: "images/castle_lvl3.png"
        opacity: 0
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

    }

    Image {
        id: lumberMill
        source: "images/lumberMill.png"
        opacity: 0
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

    }

    Image {
        id: farm
        source: "images/farm.png"
        opacity: 0
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

    }

    Image {
        id: mineunused
        source: "images/mine-unused.png"
        opacity: 0
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

    }

    Image {
        id: mineused
        source: "images/mine-used.png"
        opacity: 0
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

    }

    Image {
        id: stables
        source: "images/stables.png"
        opacity: 0
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

    }

    Image {
        id: buildingConstruction
        source: "images/building-construction2.png"
        opacity: 0
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

    }


    MouseArea{
        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            var fieldCount = game.getFieldCount(tileIndex)
            var fieldPosition = game.getCoordinates();
            if (fieldCount == 0){
                // Qt.quit(); qt quit zavre okno, muze se hodit

                game.setCoordinates(tileIndex) //metoda pro nastaveni aktualni pozice na mape

                var component = Qt.createComponent("BuildMenu.qml")
                var window = component.createObject(root)
                window.show()

                //zde bude stavba budov
                // mapTile.state = "castle"
                //  mapTile.previousState = mapTile.state

            } else if(fieldCount == 1){

               // mapTile.state = "castle"
                //zde bude interakce s hradem
            } else if(fieldCount == 2){
                mapTile.state = "castlelvl2"
            } else if(fieldCount == 3){
                mapTile.state ="castlelvl3"
            } else if(fieldCount === 4){
                //mapTile.state = "lumberMill"
                game.setCoordinates(tileIndex)

                var component2 = Qt.createComponent("PeasantMenu.qml")
                var window2 = component2.createObject(root)
                window2.show()
            } else if(fieldCount == 5){
                mapTile.state = "farm"
            } else if(fieldCount == 6){
                mapTile.state = "stables"
            } else if(fieldCount == -1){
                mapTile.state = "exited"
                //cannotBuild.open()
            } else if(fieldCount == 10){
                game.setCoordinates(tileIndex)
                var componentmine = Qt.createComponent("PeasantMenu.qml")
                var windowmine = componentmine.createObject(root)
                windowmine.show()
            } else if(fieldCount == 11){
                game.setCoordinates(tileIndex)
                var componentmineus = Qt.createComponent("PeasantMenu.qml")
                var windowmineus = componentmineus.createObject(root)
                windowmineus.show()
            }

            else{
                //nic
            }
        }

        /*
            Indexes of buildings:
            Prazdne pole - nemoznost stavby: -1
            Prazdne pole - moznost stavby: 0
            Hrad lvl1: 1
            Hrad lvl2: 2
            Hrad lvl3: 3
            Lumber Mill: 4
            Farm: 5
            Stables: 6
            Mine - unused: 10
            Mine - used: 11
            Building Construction: 20
             */

        onEntered: {

            if (game.getFieldCount(tileIndex) == -1){
                mapTile.state = "exited"
            } else if (game.getFieldCount(tileIndex) == 1){ //hrad lvl1
               // mapTile.state = "castlelvl1_hovered"
            } else if (game.getFieldCount(tileIndex) == 2){ //hrad lvl2
                mapTile.state = "castlelvl2_hovered"
            } else if (game.getFieldCount(tileIndex) == 3){ //hrad lvl3
                mapTile.state = "castlelvl3_hovered"
            } else if(game.getFieldCount(tileIndex) == 4){ //lumberMill
                mapTile.state = "lumberMill_hovered"
            } else if(game.getFieldCount(tileIndex) == 5){ //farm
                //mapTile.state = "farm_hovered"
            } else if (game.getFieldCount(tileIndex) == 6){
                //mapTile.state = "stables_hovered"
            } else if(game.getFieldCount(tileIndex) == 10){ //mine - unused
                mapTile.state = "mine-unused_hovered"
            } else if(game.getFieldCount(tileIndex) == 11){ //mine - used
                mapTile.state = "mine-used_hovered"
            } else if(game.getFieldCount(tileIndex) == 20){ //building construction
                mapTile.state = "building-construction_hovered"
            } else {
                mapTile.state = "hovered" //prazdna policka
            }
        }

        onExited: {
            if (game.getFieldCount(tileIndex) == -1){
                mapTile.state = "exited"
            } else if (game.getFieldCount(tileIndex) == 1){ //hrad lvl1
                mapTile.state = "castlelvl1"
            } else if (game.getFieldCount(tileIndex) == 2){ //hrad lvl2
                mapTile.state = "castlelvl2"
            } else if (game.getFieldCount(tileIndex) == 3){ //hrad lvl3
                mapTile.state = "castlelvl3"
            } else if(game.getFieldCount(tileIndex) == 4){ //lumberMill
                mapTile.state = "lumberMill"
            } else if(game.getFieldCount(tileIndex) == 5){ //farm
                mapTile.state = "farm"
            } else if (game.getFieldCount(tileIndex) == 6){
                mapTile.state = "stables"
            }  else if(game.getFieldCount(tileIndex) == 10){ //mine - unused
                mapTile.state = "mine-unused"               
            } else if(game.getFieldCount(tileIndex) == 11){ //mine - used
                mapTile.state = "mine-used"
            } else if(game.getFieldCount(tileIndex) == 20){ //building construction
                mapTile.state = "building-construction"
            } else {
                mapTile.state = "exited"
            }
        }

        onReleased: {

            if (game.getFieldCount(tileIndex) == 1){ //hrad lvl1
                mapTile.state = "castlelvl1_hovered"
            } else if (game.getFieldCount(tileIndex) == 2){ //hrad lvl2
                mapTile.state = "castlelvl2_hovered"
            } else if (game.getFieldCount(tileIndex) == 3){ //hrad lvl3
                mapTile.state = "castlelvl3_hovered"
            } else if(game.getFieldCount(tileIndex) == 4){ //lumberMill
                mapTile.state = "lumberMill_hovered"
            } else if(game.getFieldCount(tileIndex) == 5){ //farm
                mapTile.state = "farm_hovered"
            } else if (game.getFieldCount(tileIndex) == 6){
                mapTile.state = "stables_hovered"
            } else if(game.getFieldCount(tileIndex) == 10){ //mine - unused
                mapTile.state = "mine-unused_hovered"
            } else if(game.getFieldCount(tileIndex) == 11){ //mine - used
                mapTile.state = "mine-used_hovered"
            } else if(game.getFieldCount(tileIndex) == 20){ //building construction
                mapTile.state = "building-construction_hovered"
            } else {
                mapTile.state = "hovered" //prazdna policka
            }
        }

    }


    Text {//zkusebni
        id:label
        text: "0"
        opacity: 0
        font {
            pixelSize: 24
            bold: true
        }
        color: "red"
        anchors.centerIn: parent


    }
}

