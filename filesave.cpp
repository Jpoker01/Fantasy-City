#include "filesave.h"

QVector<QString> FileSave::m_saveFiles;
QString m_savename = "save2";
FileSave::FileSave(QObject *parent) : QObject(parent)
{

}

void FileSave::saveFile(){

    saveFileWName(m_savename);
}

void FileSave::saveFileWName(QString name){
   /* QString fileName = "../FantasyCity\\" + name + ".xml";
    QFile file(fileName);
    qCritical() << "existuji? " << file.exists();
    if(!m_saveFiles.contains(name)){
        m_saveFiles.append(name);
    }*/
    m_savename = FileLoad::setNameforSave();
    //pro zapis fields
    QString fileFields = "../FantasyCity\\" + name + "_fields.xml";
    QFile fieldsOpen(fileFields);
    qCritical() << "existuji? " << fieldsOpen.exists();

    //pro zapis resources
    QString fileResources = "../FantasyCity\\" + name + "_resources.xml";
    QFile resourcesOpen(fileResources);
    qCritical() << "existuji? " << resourcesOpen.exists();
    if(!m_saveFiles.contains(name)){
        m_saveFiles.append(name);
    }
    // musiim dodelat zvlast otevreni a zapis souboru resources a fields
    if(fieldsOpen.open(QIODevice::WriteOnly)){
        qCritical() << "zapisuji...";
        QXmlStreamWriter writer;

        writer.setDevice(&fieldsOpen);
        writer.setAutoFormatting(true);
        writer.writeStartDocument();
        writer.writeStartElement("fields");

        //projde celé pole a zapíše jednotlivé indexy a jejich obsah
        for (int i = 0; i < 49; i++){
            writer.writeStartElement("field");
            writer.writeAttribute("index", QString::number(i));
            writer.writeCharacters(QString::number(Game::getFieldCount(i)));
            writer.writeEndElement();
        }
        for (int i = 0; i < 49; i++){
            writer.writeStartElement("working");
            writer.writeAttribute("index", QString::number(i));
            writer.writeCharacters(QString::number(Game::getWorking(i)));
            writer.writeEndElement();
        }

        for (int i = 0; i<m_saveFiles.size(); i++){
            writer.writeStartElement("save");
            writer.writeAttribute("index", QString::number(i));
            writer.writeCharacters(FileSave::getAllSaveFiles().at(i));
            writer.writeEndElement();
        }

        writer.writeEndElement();
        writer.writeEndDocument();
    }
    fieldsOpen.close();

    //pro resources ukladani
    if(resourcesOpen.open(QIODevice::WriteOnly)){
        qCritical() << "zapisuji...";
        QXmlStreamWriter writer;

        writer.setDevice(&resourcesOpen);
        writer.setAutoFormatting(true);
        writer.writeStartDocument();
        writer.writeStartElement("resources");

        writer.writeStartElement("gold");
        writer.writeCharacters(QString::number(Game::getGolds()));
        writer.writeEndElement();

        writer.writeStartElement("wood");
        writer.writeCharacters(QString::number(Game::getWoods()));
        writer.writeEndElement();

        writer.writeStartElement("workers");
        writer.writeCharacters(QString::number(Game::getWorkers()));
        writer.writeEndElement();

        writer.writeEndElement();
        writer.writeEndDocument();
    }
    resourcesOpen.close();

   // m_saveFiles.push_back(name);

    //
    /*
    if(file.open(QIODevice::WriteOnly)){
        qCritical() << "zapisuji...";
        QXmlStreamWriter writer;

        writer.setDevice(&file);
        writer.setAutoFormatting(true);
        writer.writeStartDocument();
        writer.writeStartElement("fields");

        //projde celé pole a zapíše jednotlivé indexy a jejich obsah
        for (int i = 0; i < 49; i++){
            writer.writeStartElement("field");
            writer.writeAttribute("index", QString::number(i));
            writer.writeCharacters(QString::number(Game::getFieldCount(i)));
            writer.writeEndElement();
        }
        writer.writeStartElement("gold");
        writer.writeCharacters(QString::number(Game::getGolds()));
        writer.writeEndElement();

        writer.writeStartElement("wood");
        writer.writeCharacters(QString::number(Game::getWoods()));
        writer.writeEndElement();

        writer.writeStartElement("workers");
        writer.writeCharacters(QString::number(Game::getWorkers()));
        writer.writeEndElement();

        /*for (int i = 0; i<m_saveFiles.size(); i++){
            writer.writeStartElement("save");
            writer.writeAttribute("index", QString::number(i));
            writer.writeCharacters(FileSave::getAllSaveFiles().at(i));
            writer.writeEndElement();
        }*/
/*
        writer.writeEndElement();
        writer.writeEndDocument();
    }

    file.close();*/
}

QVector<QString> FileSave::getAllSaveFiles(){
    /*for(auto fileName = m_saveFiles.begin(); fileName != m_saveFiles.end(); fileName++){
        if(!QFile::exists(*fileName)){
            m_saveFiles.erase(fileName);
        }
    }*/
    return m_saveFiles;
}
int FileSave::numberOfSaves(){
    return m_saveFiles.size();
}

QString FileSave::getSaveFile(int index){
    return m_saveFiles.at(index);
}
