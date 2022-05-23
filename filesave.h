#ifndef FILESAVE_H
#define FILESAVE_H

#include "game.h"

#include <QObject>
#include <vector>
#include <QXmlStreamWriter>
#include <QFile>
#include <QtDebug>

class FileSave : public QObject
{
    Q_OBJECT
public:
    explicit FileSave(QObject *parent = nullptr);
    Q_INVOKABLE static void saveFile();
    Q_INVOKABLE static void saveFileWName(QString name);
    Q_INVOKABLE static QVector<QString> getAllSaveFiles();
    Q_INVOKABLE static QString getSaveFile(int index);
    Q_INVOKABLE static int numberOfSaves();
private:
    static QVector<QString> m_saveFiles;

signals:

};

#endif // FILESAVE_H
