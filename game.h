#ifndef GAME_H
#define GAME_H

#include <QObject>
#include <QCoreApplication>
#include <vector>
#include <QTimer>//pro delniky
//#include <QMediaPlayer>

#include "fileload.h"


/* bude existovat jen jedna hra v jeden moment,
 * proto je celá třída statická
 */

class Game : public QObject
{
    Q_OBJECT
private:
    QTimer *timer;
    static std::vector<int> m_fields;
    static int m_golds; //bude zaznamenavat penize,
    static int m_woods;
    static int m_workers;
    static int m_coordinate;
    static std::vector<int> m_working;
    static std::vector<QString> m_saveFiles;


public:
    explicit Game(QObject *parent = nullptr);


    Q_INVOKABLE static void loadGame(QString name);

    Q_INVOKABLE static int getFieldCount(int index);//vraci aktualni pole v XML
    Q_INVOKABLE static int setCoordinates(int coordinate); // zaznamena dany pole
    Q_INVOKABLE static int getCoordinates();//vraci uložené souřadnice

    Q_INVOKABLE static void setFieldCount(int index, int building);

    Q_INVOKABLE static bool buyBuilding(int golds, int woods); //metoda pro nakup dane budovy
    Q_INVOKABLE static int getGolds();
    Q_INVOKABLE static int getWoods();
    Q_INVOKABLE static int getWorkers();
    Q_INVOKABLE static int getWorking(int index); //pro zobrazeni pridelenych pracovniku na aktualni pozici

    Q_INVOKABLE static int payGolds(int price); //metoda na zaplaceni budovy
    Q_INVOKABLE static int payWoods(int price); //zaplati v drevu

    Q_INVOKABLE static void getToWork(int index); //metoda pro praci
    Q_INVOKABLE static void removeWorkers(int index); //metoda pro odebrani delniku

    Q_INVOKABLE static void newWorkers(int workers);


    Q_INVOKABLE static int getNewGolds(int index); //metoda pro vydelavani goldu
    Q_INVOKABLE static int getNewWoods(int index); //

    Q_INVOKABLE static void quitGame();
public slots:
    void timeWorking(); //nastaveni timeru
signals:


};

#endif // GAME_H
