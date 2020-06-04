#ifndef DATALOADER_H
#define DATALOADER_H

#include <QString>
#include <QFile>
#include <QDebug>
#include <QByteArray>
#include <QSharedPointer>
#include <QObject>

class DataLoader : public QObject
{
    Q_OBJECT
public:
    DataLoader(QString filepath = (QString{PROJECT_PATH} + QString{"/Data/periodData.json"}));
    bool importData();
    QSharedPointer<QByteArray> getData() const;

public slots:
    void writeData(QByteArray data);
private:
    QString m_filepath;
    QSharedPointer<QByteArray> m_data;
};

#endif // DATALOADER_H
