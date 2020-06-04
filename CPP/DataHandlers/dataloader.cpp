#include "dataloader.h"

DataLoader::DataLoader(QString filepath):
    m_filepath{filepath},
    m_data{ QSharedPointer<QByteArray>(new QByteArray)}
{}

bool DataLoader::importData()
{
    QFile dataFile {m_filepath};
    bool status = false;

    if(dataFile.open(QIODevice::ReadWrite | QIODevice::Text))
    {
        *m_data = dataFile.readAll();
        dataFile.close();
        status = true;
    }
    else
    {
        qDebug() << "Invalid entry file!";
    }
    return status;
}

QSharedPointer<QByteArray> DataLoader::getData() const
{
    return m_data;
}

void DataLoader::writeData(QByteArray data)
{
    QFile dataFile {m_filepath};

    if(dataFile.open(QIODevice::WriteOnly | QIODevice::Text))
    {
        dataFile.resize(0);
        QTextStream out(&dataFile);
        out << data.data();
        dataFile.close();

    }
}
