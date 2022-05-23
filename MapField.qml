import QtQuick 2.0

Rectangle{
    id: mapField
    opacity: 100
    color: "transparent"


    Grid{

        id: mapGrid
        columns: 7
        spacing: 10

        Repeater{
            model: 49

            MapTile{
                tileIndex: index
                opacity: 0
            }
        }

    }
}
