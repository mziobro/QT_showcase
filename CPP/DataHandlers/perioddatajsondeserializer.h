#ifndef PERIODDATAJSONDESERIALIZER_H
#define PERIODDATAJSONDESERIALIZER_H

#include <QList>
#include <QObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QSharedPointer>
#include <QByteArray>
#include <QObject>

class PeriodDataJsonDeserializer : public QObject
{
    Q_OBJECT
public:
    explicit PeriodDataJsonDeserializer(QObject * parent = nullptr);
    void deserialize(QSharedPointer<QByteArray> data);


    Q_INVOKABLE void addRecord(QString value);
    Q_INVOKABLE QList<double> readData();

    const QByteArray serialize();

signals:
    void dataChanged(QByteArray);

public slots:
private:
    QList<double> m_temperatureRecords;
};

#endif // PERIODDATAJSONDESERIALIZER_H
