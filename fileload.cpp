#include "fileload.h"

QString m_fileName;

FileLoad::FileLoad()
{

}

std::vector<int> FileLoad::loadXml(QString fileName){
    std::vector<int> fields(49, 0);
    //nacteni souboru
    QString filePath = "../FantasyCity\\" + fileName + "_fields.xml";
    QFile file(filePath);
    if(fileName != "save1"){
        m_fileName = fileName;
    }else{
        m_fileName = "saveBackup";
    }

    if(file.open(QIODevice::ReadOnly)){
            //napojit XML parser
            QXmlStreamReader xmlReader;
            xmlReader.setDevice(&file);
            xmlReader.readNext();

            while(!xmlReader.isEndDocument()){
                if(xmlReader.isStartElement()){
                     QString name = xmlReader.name().toString();


                if(name=="field"){
                    int index = xmlReader.attributes().value("index").toInt();
                    int fieldCount = xmlReader.readElementText().toInt();
                    fields.at(index) = fieldCount;
                } else if (name == "fields"){
                    //skip
                }else{

                }
            }
            xmlReader.readNext();
            }
        }
    else{
        qCritical() << "Cannot open the file\n";
    }

    return fields;
}

int FileLoad::loadGolds(QString fileName){
    int golds = 0;
    QString filePath = "../FantasyCity\\" + fileName + "_resources.xml";
    QFile file(filePath);
    if(file.open(QIODevice::ReadOnly)){

            //napojit XML parser
            QXmlStreamReader xmlReader;
            xmlReader.setDevice(&file);
            xmlReader.readNext();

            while(!xmlReader.isEndDocument()){
                if(xmlReader.isStartElement()){
                     QString name = xmlReader.name().toString();


                if(name=="gold"){

                    int value = xmlReader.readElementText().toInt();
                    golds = value;
                } else{

                    //skip
                }
            }
            //dalsi element
            xmlReader.readNext();
            }
        }
    else{
        qCritical() << "Cannot open the file\n";
    }
    return golds;
}

int FileLoad::loadWoods(QString fileName){
    int woods = 0;
    QString filePath = "../FantasyCity\\" + fileName + "_resources.xml";
    QFile file(filePath);
    if(file.open(QIODevice::ReadOnly)){       
            //napojit XML parser
            QXmlStreamReader xmlReader;
            xmlReader.setDevice(&file);
            xmlReader.readNext();

            while(!xmlReader.isEndDocument()){
                if(xmlReader.isStartElement()){
                     QString name = xmlReader.name().toString();


                if(name=="wood"){

                    int value = xmlReader.readElementText().toInt();
                    woods = value;
                } else{

                    //skip
                }
            }
            //dalsi element
            xmlReader.readNext();
            }
        }
    else{
        qCritical() << "Cannot open the file\n";
    }
    return woods;
}
int FileLoad::loadWorkers(QString fileName){
    int workers = 0;
    QString filePath = "../FantasyCity\\" + fileName + "_resources.xml";
    QFile file(filePath);
    if(file.open(QIODevice::ReadOnly)){
            //napojit XML parser
            QXmlStreamReader xmlReader;
            xmlReader.setDevice(&file);
            xmlReader.readNext();

            while(!xmlReader.isEndDocument()){
                if(xmlReader.isStartElement()){
                     QString name = xmlReader.name().toString();


                if(name=="workers"){

                    int value = xmlReader.readElementText().toInt();
                    workers = value;
                }
                else{

                    //skip
                }
            }
            //dalsi element
            xmlReader.readNext();
            }
        }
    else{
        qCritical() << "Cannot open the file\n";
    }
    return workers;
}
std::vector<int> FileLoad::loadWorking(QString fileName){
    std::vector<int> working(49, 0);
    //nacteni souboru
    QString filePath = "../FantasyCity\\" + fileName + "_fields.xml";
    QFile file(filePath);

    if(file.open(QIODevice::ReadOnly)){
            //napojit XML parser
            QXmlStreamReader xmlReader;
            xmlReader.setDevice(&file);
            xmlReader.readNext();

            while(!xmlReader.isEndDocument()){
                if(xmlReader.isStartElement()){
                     QString name = xmlReader.name().toString();


                if(name=="working"){
                    int index = xmlReader.attributes().value("index").toInt();
                    int fieldCount = xmlReader.readElementText().toInt();
                    working.at(index) = fieldCount;
                } else if (name == "fields"){
                    //skip
                }else{
                    //skip
                }
            }
            xmlReader.readNext();
            }
        }
    else{
        qCritical() << "Cannot open the file\n";
    }
    return working;
}

std::vector<QString> FileLoad::loadSaveFiles(QString fileName){
    std::vector<QString> saveFiles;
    //nacteni souboru
    QString filePath = "../FantasyCity\\" + fileName + "_fields.xml";
    QFile file(filePath);

    if(file.open(QIODevice::ReadOnly)){
            //napojit XML parser
            QXmlStreamReader xmlReader;
            xmlReader.setDevice(&file);
            xmlReader.readNext();

            while(!xmlReader.isEndDocument()){
                if(xmlReader.isStartElement()){
                     QString name = xmlReader.name().toString();


                if(name=="save"){
                    QString saveName = xmlReader.readElementText();
                    saveFiles.push_back(saveName);
                } else if (name == "fields"){
                    //skip
                }else{
                    //skip
                }
            }
            xmlReader.readNext();
            }
        }
    else{
        qCritical() << "Cannot open the file\n";
    }

    return saveFiles;
}

QString FileLoad::setNameforSave(){
    return m_fileName;
}

