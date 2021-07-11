import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid19/components/IconContent.dart';
import 'package:flutter_covid19/components/ReusableCard.dart';
import 'package:flutter_covid19/models/ChartData.dart';
import 'package:flutter_covid19/models/ConstantDaily.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../Constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  String newConfirm = "???";
  String confirmTotal = "???";
  String newRecover = "???";
  String recoverTotal = "???";
  String newDeath = "???";
  String deathTotal = "???";
  String date = "???";
  List timeline;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    callService();
  }

  void callService() async {
    var covidConstant = await ConstantDaily().callGetCovidConstantDaily();
    var covidTimeline = await ConstantDaily().callGetCovidTimeline();
    print(covidConstant);
    print(covidTimeline);
    updateUI(covidConstant);
    updateTimelineUI(covidTimeline);
    isLoading = true;
  }

  void _onRefresh() async {
    callService();
    _refreshController.refreshCompleted();
  }

  void updateUI(dynamic covidConstant) {
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

  void updateTimelineUI(dynamic covidTimeline) {
    setState(() {
      timeline = covidTimeline["Data"].reversed.toList().sublist(0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    var timelineChart = ChartData(timeline: timeline);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BearmanCovid19",
          style: TextStyle(foreground: Paint()..shader = linearGradient),
        ),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                        padding: const EdgeInsets.only(
                            right: 18.0, left: 12.0, top: 50),
                        child: LineChart(isLoading
                            ? timelineChart.showTimelineChart()
                            : timelineChart.showPreloadTimelineChart()),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
