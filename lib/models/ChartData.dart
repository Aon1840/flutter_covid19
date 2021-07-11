import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class ChartData {
  final timeline;

  ChartData({this.timeline});

  LineChartData showTimelineChart() {
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

  LineChartData showPreloadTimelineChart() {
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
          spots: [],
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
