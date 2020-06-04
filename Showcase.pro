QT += quick qml core charts gui
CONFIG += c++14

DEFINES += QT_DEPRECATED_WARNINGS \
           PROJECT_PATH=\\\"$$PWD\\\"

SOURCES += \
        CPP/DataHandlers/dataloader.cpp \
        CPP/DataHandlers/perioddatajsondeserializer.cpp \
        main.cpp

RESOURCES += \
    app.qrc

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    CPP/DataHandlers/dataloader.h \
    CPP/DataHandlers/perioddatajsondeserializer.h
