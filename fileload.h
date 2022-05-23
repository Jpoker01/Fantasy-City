#ifndef FILELOAD_H
#define FILELOAD_H

#include <vector>
#include <QXmlStreamReader>
#include <QFile>
#include <QDebug>

class FileLoad
{
public:
    FileLoad();

    static std::vector<int> loadXml(QString fileName);
    static int loadGolds(QString fileName);
    static int loadWoods(QString fileName);
    static int loadWorkers(QString fileName);
    static std::vector<int> loadWorking(QString fileName);
    static std::vector<QString> loadSaveFiles(QString fileName);
    static QString setNameforSave();
};

#endif // FILELOAD_H
