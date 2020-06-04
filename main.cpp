#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "CPP\dataHandlers\dataloader.h"
#include "CPP\dataHandlers\perioddatajsondeserializer.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    DataLoader dataReader;
    PeriodDataJsonDeserializer periodData;

    if(dataReader.importData())
    {
        periodData.deserialize(dataReader.getData());
    }

    QObject::connect(&periodData, &PeriodDataJsonDeserializer::dataChanged, &dataReader,
                     &DataLoader::writeData);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("periodData", &periodData);

    engine.addImportPath("qrc:/");
    const QUrl url(QStringLiteral("qrc:main/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
