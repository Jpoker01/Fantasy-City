#include "game.h"
#include <QMediaPlayer>

std::vector<int> Game::m_fields;
int Game::m_golds; //bude zaznamenavat penize,
int Game::m_woods;
int Game::m_workers;
int Game::m_coordinate;
std::vector<int> Game::m_working;
std::vector<QString> Game::m_saveFiles;


Game::Game(QObject *parent) : QObject(parent)
{
    //loadGame();
    loadGame("save1");
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()),this,SLOT(timeWorking()));
    timer->start(5000); //nastaveni casovace na 5s
    //pro preravani hudby
   QMediaPlayer* music = new QMediaPlayer();
    music->setMedia(QUrl("qrc:/sounds/background2.mp3"));
    music->play();





}


void Game::loadGame(QString fileName){
    m_fields.resize(49);
    m_fields = FileLoad::loadXml(fileName);
    m_golds = FileLoad::loadGolds(fileName);
    m_woods = FileLoad::loadWoods(fileName);
    m_workers = FileLoad::loadWorkers(fileName);
    m_coordinate = 0;
    m_working = FileLoad::loadWorking(fileName);
    m_saveFiles = FileLoad::loadSaveFiles(fileName);


}

int Game::getFieldCount(int index){
    return m_fields.at(index);
}

int Game::setCoordinates(int coordinate){
    m_coordinate = coordinate;
    return m_coordinate;
}
int Game::getCoordinates(){
    return m_coordinate;
}
int Game::getWorking(int index){
    return m_working.at(index);
}

void Game::setFieldCount(int index, int building){
    m_fields.at(index) = building;

}
bool Game::buyBuilding(int golds, int woods){

    if(m_golds >= golds && m_woods >= woods){
       static QMediaPlayer* work_sound;
        work_sound = new QMediaPlayer();
        work_sound->setMedia(QUrl::fromLocalFile("../FantasyCity/build.wav"));


        work_sound->play();
        return true;
    }
    else {
        static QMediaPlayer* false_sound;
        false_sound = new QMediaPlayer();
        false_sound->setMedia(QUrl::fromLocalFile("../FantasyCity/notMoney.wav"));

        false_sound->play();
        return false;
    }
}
int Game::getGolds(){

    return m_golds;
}
int Game::getWoods(){
    return m_woods;
}
int Game::getWorkers(){
    return m_workers;
}
int Game::payGolds(int price){
    m_golds = m_golds - price;
    return m_golds;
}
int Game::payWoods(int price){
    m_woods = m_woods - price;
    return m_woods;
}

void Game::getToWork(int index){

    if((m_workers > 0) && (m_working.at(index) < 5)){
         m_working.at(index) += 1;

    m_workers = m_workers - 1; // pro aktualni prideleni delniku

    static QMediaPlayer* work_sound;
    work_sound = new QMediaPlayer();
    work_sound->setMedia(QUrl::fromLocalFile("../FantasyCity/work.wav"));

    work_sound->play();

    }
}
void Game::removeWorkers(int index){
    if(m_working.at(index) > 0){

        m_working.at(index) -= 1;
        m_workers += 1;
        static QMediaPlayer* work_sound;
        work_sound = new QMediaPlayer();
        work_sound->setMedia(QUrl::fromLocalFile("../FantasyCity/RemoveWork.wav"));

        work_sound->play();
    }
}
void Game::newWorkers(int workers){
    m_workers += workers;

}

int Game::getNewGolds(int index){
    if((m_fields.at(index) == 10) || (m_fields.at(index) == 11)){
        return (2 * m_working.at(index));
    } else{
        return 0;
    }

}
int Game::getNewWoods(int index){
    if(m_fields.at(index) == 4){
        return (2 * m_working.at(index));
    } else return 0;

}

void Game::quitGame(){
    QCoreApplication::quit();
}
void Game::timeWorking(){
    for(int i = 0; i < 49;i++){
        if(m_fields.at(i) == 4){
            //pokud je Lumber mill
            if(m_working.at(i) > 0){
                m_woods = m_woods + (2 * m_working.at(i));
            }
        } else if((m_fields.at(i) == 10) || (m_fields.at(i) == 11)){
            //pokud je Mine used/unused
            if(m_working.at(i) > 0){
                m_golds = m_golds + (6 * m_working.at(i));
            }
        }
    }
}
