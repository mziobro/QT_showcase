import QtQuick 2.12
import Assets 1.0

import QtCharts 2.2

Item {
    id: root
    width: Style.screenWidth
    height: Style.screenHeight

    ChartView {
        id: chart
        anchors.fill: parent

        title: "Temperature records"
        titleFont.pixelSize: Style.chartTitleFontSize
        titleFont.bold: true
        titleColor: Style.textColor
        legend.alignment: Qt.AlignRight
        legend.color: Style.textColor
        antialiasing: true
        backgroundColor : Style.lighterComponentColor

        ValueAxis{
            id: yAxis
            min: chart.setMinimalValue()
            max: chart.setMaximalValue()
        }

        ValueAxis{
            id: xAxis
            max: periodData.readData().length
            min: 0
        }

        LineSeries {
            id: series1
            axisX: xAxis
            axisY: yAxis
            name: "Temperature [C]"
            width: 4.0
            color: "#FFFFFF"
        }

        Component.onCompleted: {
            chart.fillSerieswithTemperatureData()
        }
        Connections{
            target: periodData
            onDataChanged: {
                series1.append(periodData.readData().length - 1, periodData.readData()[periodData.readData().length -1])
                yAxis.min = chart.setMinimalValue()
                yAxis.max = chart.setMaximalValue()
            }
        }

        function fillSerieswithTemperatureData(){
            console.log(periodData.readData())
            for (var i = 0; i < periodData.readData().length ; i++)
            {
                series1.append(i, (periodData.readData())[i]);
                console.log(periodData.readData()[i])
            }
        }

        function setMinimalValue()
        {
            return Math.min.apply(Math, periodData.readData()) - 1
        }
        function setMaximalValue()
        {
            return Math.max.apply(Math,periodData.readData()) + 1
        }
    }
}



