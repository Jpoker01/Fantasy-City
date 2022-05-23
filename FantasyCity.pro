QT += quick \
multimedia

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        fileload.cpp \
        filesave.cpp \
        game.cpp \
        main.cpp

RESOURCES += qml.qrc \
    images.qrc \
    qml.qrc \
    res.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    .gitignore \
    BuildMenu.qml \
    FantasyCity \
    FantasyCity.pro.user \
    MainMenu.qml \
    MapField.qml \
    MapTile.qml \
    PeasantMenu.qml \
    documentation.txt \
    main.qml \
    save1.xml \
    save1_fields.xml \
    save1_resources.xml \
    save2.xml

HEADERS += \
    fileload.h \
    filesave.h \
    game.h
