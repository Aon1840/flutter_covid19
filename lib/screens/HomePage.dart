import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid19/components/IconContent.dart';
import 'package:flutter_covid19/components/ReusableCard.dart';
import 'package:flutter_covid19/models/ConstantDaily.dart';

import '../Constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showAvg = false;
  String newConfirm = "???";
  String confirmTotal = "???";
  String newRecover = "???";
  String recoverTotal = "???";
  String newDeath = "???";
  String deathTotal = "???";
  String date = "???";
  List timeline;

  @override
  void initState() {
    super.initState();
    getCovidConstant();
    getCovidTimeline();
  }

  void getCovidConstant() async {
    var covidConstant = await ConstantDaily().callGetCovidConstantDaily();
    setState(() {
      newConfirm = covidConstant["NewConfirmed"].toString();
      confirmTotal = covidConstant["Confirmed"].toString();
      newRecover = covidConstant["NewRecovered"].toString();
      recoverTotal = covidConstant["Recovered"].toString();
      newDeath = covidConstant["NewDeaths"].toString();
      deathTotal = covidConstant["Deaths"].toString();
      date = covidConstant["UpdateDate"].toString();
    });
  }

  void getCovidTimeline() async {
    var covidTimeline = await ConstantDaily().callGetCovidTimeline();
    setState(() {
      timeline = covidTimeline["Data"].reversed.toList().sublist(0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BearmanCovid19",
          style: TextStyle(foreground: Paint()..shader = linearGradient),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          "ข้อมูล ณ วันที่ $date",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: "Khanit"),
        ),
        Expanded(
          child: ReusableCard(
            cardChild: IconContent(
              todayAmount: newConfirm,
              totalAmount: confirmTotal,
              sectionName: "ยอดผู้ติดเชื้อ",
              colorSection: Paint()..shader = newConfirmGradient,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(
                    todayAmount: newRecover,
                    totalAmount: recoverTotal,
                    sectionName: "หายแล้ว",
                    colorSection: Paint()..shader = newRecoveredGradient,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(
                    todayAmount: newDeath,
                    totalAmount: deathTotal,
                    sectionName: "ยอดผู้เสียชีวิต",
                    colorSection: Paint()..shader = newDeathGradient,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            cardChild: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "กราฟแสดงยอดผู้ติดเชื้อย้อนหลัง",
                    style: TextStyle(fontFamily: "Khanit"),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 18.0, left: 12.0, top: 50),
                    child: LineChart(mainData()),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return timeline[7]["Date"].toString().substring(0, 5);
              case 4:
                return timeline[5]["Date"].toString().substring(0, 5);
              case 6:
                return timeline[3]["Date"].toString().substring(0, 5);
              case 8:
                return timeline[1]["Date"].toString().substring(0, 5);
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2000:
                return '2k';
              case 6000:
                return '6k';
              case 10000:
                return '10k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 9,
      minY: 0,
      maxY: 10000,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, timeline[9]["NewConfirmed"].toDouble()),
            FlSpot(1, timeline[8]["NewConfirmed"].toDouble()),
            FlSpot(2, timeline[7]["NewConfirmed"].toDouble()),
            FlSpot(3, timeline[6]["NewConfirmed"].toDouble()),
            FlSpot(4, timeline[5]["NewConfirmed"].toDouble()),
            FlSpot(5, timeline[4]["NewConfirmed"].toDouble()),
            FlSpot(6, timeline[3]["NewConfirmed"].toDouble()),
            FlSpot(7, timeline[2]["NewConfirmed"].toDouble()),
            FlSpot(8, timeline[1]["NewConfirmed"].toDouble()),
            FlSpot(9, timeline[0]["NewConfirmed"].toDouble()),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
