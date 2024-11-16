import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dotted_line/dotted_line.dart';

import '../core/fonts.dart';
import '../core/utils.dart';

class PieChartWeek extends StatelessWidget {
  const PieChartWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 308,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _Chart(
            title: 'Mon',
            incomes: weekamounts(false)[0],
            expenses: weekamounts(true)[0],
          ),
          const DottedLine(
            dashLength: 2,
            dashGapLength: 2,
            direction: Axis.vertical,
            dashColor: Color(0xff939393),
          ),
          _Chart(
            title: 'Tue',
            incomes: weekamounts(false)[1],
            expenses: weekamounts(true)[1],
          ),
          const DottedLine(
            dashLength: 2,
            dashGapLength: 2,
            direction: Axis.vertical,
            dashColor: Color(0xff939393),
          ),
          _Chart(
            title: 'Wed',
            incomes: weekamounts(false)[2],
            expenses: weekamounts(true)[2],
          ),
          const DottedLine(
            dashLength: 2,
            dashGapLength: 2,
            direction: Axis.vertical,
            dashColor: Color(0xff939393),
          ),
          _Chart(
            title: 'Thr',
            incomes: weekamounts(false)[3],
            expenses: weekamounts(true)[3],
          ),
          const DottedLine(
            dashLength: 2,
            dashGapLength: 2,
            direction: Axis.vertical,
            dashColor: Color(0xff939393),
          ),
          _Chart(
            title: 'Fri',
            incomes: weekamounts(false)[4],
            expenses: weekamounts(true)[4],
          ),
          const DottedLine(
            dashLength: 2,
            dashGapLength: 2,
            direction: Axis.vertical,
            dashColor: Color(0xff939393),
          ),
          _Chart(
            title: 'Sat',
            incomes: weekamounts(false)[5],
            expenses: weekamounts(true)[5],
          ),
          const DottedLine(
            dashLength: 2,
            dashGapLength: 2,
            direction: Axis.vertical,
            dashColor: Color(0xff939393),
          ),
          _Chart(
            title: 'Sun',
            incomes: weekamounts(false)[6],
            expenses: weekamounts(true)[6],
          ),
        ],
      ),
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart({
    required this.title,
    required this.incomes,
    required this.expenses,
  });

  final String title;
  final double incomes;
  final double expenses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                width: 38,
                height: 38,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 1,
                    startDegreeOffset: 90,
                    sections: [
                      PieChartSectionData(
                        color: const Color(0xffFF0000),
                        value: expenses.toDouble(),
                        radius: 19,
                        title: '\$${expenses.toInt()}',
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 5,
                          fontFamily: Fonts.w400,
                        ),
                      ),
                      PieChartSectionData(
                        color: const Color(0xff00AE20),
                        value: incomes.toDouble(),
                        radius: 19,
                        title: '\$${incomes.toInt()}',
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 5,
                          fontFamily: Fonts.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const DottedLine(
            dashLength: 2,
            dashGapLength: 2,
            dashColor: Color(0xff939393),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff333333),
              fontSize: 12,
              fontFamily: Fonts.w400,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
