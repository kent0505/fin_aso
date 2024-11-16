import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

import '../core/fonts.dart';
import '../core/utils.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    required this.id,
    required this.pieChart,
  });

  final int id;
  final Widget pieChart;

  @override
  Widget build(BuildContext context) {
    int expenses = 0;
    int incomes = 0;

    if (id == 1) {
      expenses = nowamount(true);
      incomes = nowamount(false);
    }
    if (id == 2) {
      for (double i in weekamounts(true)) {
        expenses += i.toInt();
      }
      for (double i in weekamounts(false)) {
        incomes += i.toInt();
      }
    }
    if (id == 3) {
      for (double i in monthamounts(true)) {
        expenses += i.toInt();
      }
      for (double i in monthamounts(false)) {
        incomes += i.toInt();
      }
    }
    final total = incomes - expenses;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          pieChart,
          const SizedBox(height: 26),
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Legend(true),
                _Legend(false),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Container(
            height: 84,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                _Data(
                  title: 'Income',
                  amount: '\$$incomes',
                ),
                const DottedLine(
                  dashLength: 2,
                  dashGapLength: 2,
                  direction: Axis.vertical,
                  dashColor: Color(0xff939393),
                ),
                _Data(
                  title: 'Expense',
                  amount: '\$$expenses',
                ),
                const DottedLine(
                  dashLength: 2,
                  dashGapLength: 2,
                  direction: Axis.vertical,
                  dashColor: Color(0xff939393),
                ),
                _Data(
                  title: 'Total',
                  amount: '\$$total',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend(this.expense);

  final bool expense;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: expense ? const Color(0xffFF0000) : const Color(0xff00AE20),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          expense ? 'Expense' : 'Income',
          style: const TextStyle(
            color: Color(0xff333333),
            fontSize: 12,
            fontFamily: Fonts.w400,
          ),
        ),
      ],
    );
  }
}

class _Data extends StatelessWidget {
  const _Data({
    required this.title,
    required this.amount,
  });

  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                  fontFamily: Fonts.w700,
                ),
              ),
            ),
          ),
          const DottedLine(
            dashLength: 2,
            dashGapLength: 2,
            dashColor: Color(0xff939393),
          ),
          SizedBox(
            height: 43,
            child: Center(
              child: Text(
                amount,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 16,
                  fontFamily: Fonts.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
