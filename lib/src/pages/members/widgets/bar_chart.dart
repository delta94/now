import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const chartLabelsTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 12.0,
  fontWeight: FontWeight.w600,
);

class BarChartOnline extends StatelessWidget {
  final List<double> files;

  const BarChartOnline({@required this.files});

  @override
  Widget build(BuildContext context) {
    DateFormat format = new DateFormat('dd/MM');
    final _size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: _size.height * .4,
            width: _size.width,
            padding: EdgeInsets.symmetric(horizontal: _size.width * .06),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 16.0,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    margin: 10.0,
                    showTitles: true,
                    textStyle: chartLabelsTextStyle,
                    rotateAngle: 35.0,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return format.format(
                              DateTime.now().subtract(new Duration(days: 6)));
                        case 1:
                          return format.format(
                              DateTime.now().subtract(new Duration(days: 5)));
                        case 2:
                          return format.format(
                              DateTime.now().subtract(new Duration(days: 4)));
                        case 3:
                          return format.format(
                              DateTime.now().subtract(new Duration(days: 3)));
                        case 4:
                          return format.format(
                              DateTime.now().subtract(new Duration(days: 2)));
                        case 5:
                          return format.format(
                              DateTime.now().subtract(new Duration(days: 1)));
                        case 6:
                          return format.format(DateTime.now());
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                      margin: 10.0,
                      showTitles: true,
                      textStyle: chartLabelsTextStyle,
                      getTitles: (value) {
                        if (value == 0) {
                          return '0';
                        } else if (value % 3 == 0) {
                          return '${value ~/ 3 * 5}K';
                        }
                        return '';
                      }),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 3 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black12,
                    strokeWidth: 1.2,
                    dashArray: [4],
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: files
                    .asMap()
                    .map((key, value) => MapEntry(
                        key,
                        BarChartGroupData(
                          x: key,
                          barRods: [
                            BarChartRodData(
                              y: value / (5 / 3),
                              color: Colors.blueAccent,
                            ),
                          ],
                        )))
                    .values
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
