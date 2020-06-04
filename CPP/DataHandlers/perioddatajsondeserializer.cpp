#include "perioddatajsondeserializer.h"
#include <QDebug>

PeriodDataJsonDeserializer::PeriodDataJsonDeserializer(QObject * parent)
    : QObject{parent}
{}

void PeriodDataJsonDeserializer::deserialize(QSharedPointer<QByteArray> data)
{
    QJsonDocument capturedData {QJsonDocument::fromJson(*data)};
    QJsonObject   jsonObject {capturedData.object()};

    if (jsonObject.contains("value"))
    {
        QVariantList temperatures = jsonObject["value"].toArray().toVariantList();

        for(auto v : temperatures)
        {
            m_temperatureRecords << v.value<double>();
        }
        qDebug() << m_temperatureRecords;
    }

    else{
        qDebug() << "Not valid";
    }
}

void PeriodDataJsonDeserializer::addRecord(QString value)
{
    m_temperatureRecords << value.toDouble();

    emit dataChanged(serialize());
}

QList<double> PeriodDataJsonDeserializer::readData()
{
    return m_temperatureRecords;
}

const QByteArray PeriodDataJsonDeserializer::serialize()
{
    QJsonArray temp;
    for(auto x : m_temperatureRecords)
    {
        temp.append(QJsonValue(x));
    }

    QJsonObject obj;
    obj.insert("value", temp);
    QJsonDocument jsonDoc{obj};

    return QByteArray(jsonDoc.toJson());
}
