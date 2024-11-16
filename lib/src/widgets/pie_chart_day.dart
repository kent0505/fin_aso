import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dotted_line/dotted_line.dart';

import '../core/fonts.dart';
import '../core/utils.dart';

class PieChartDay extends StatelessWidget {
  const PieChartDay({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses = nowamount(true);
    final incomes = nowamount(false);

    return Container(
      height: 308,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                width: 180,
                height: 180,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 1,
                    startDegreeOffset: 90,
                    sections: [
                      PieChartSectionData(
                        color: const Color(0xffFF0000),
                        value: expenses.toDouble(),
                        radius: 90,
                        title: '\$$expenses',
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: Fonts.w400,
                        ),
                      ),
                      PieChartSectionData(
                        color: const Color(0xff00AE20),
                        value: incomes.toDouble(),
                        radius: 90,
                        title: '\$$incomes',
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
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
            formatCurrentDate(),
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
