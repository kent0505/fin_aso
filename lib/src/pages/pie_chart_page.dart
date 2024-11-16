import 'package:flutter/material.dart';

import '../core/utils.dart';
import '../widgets/pie_chart_day.dart';
import '../widgets/pie_chart_month.dart';
import '../widgets/pie_chart_week.dart';
import '../widgets/my_tab_widget.dart';
import '../widgets/pie_chart_widget.dart';
import '../widgets/title_text.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10 + getTop(context)),
        const TitleText('Settings'),
        const SizedBox(height: 40),
        const Expanded(
          child: MyTabWidget(
            titles: [
              'Day',
              'Week',
              'Month',
            ],
            pages: [
              PieChartWidget(id: 1, pieChart: PieChartDay()),
              PieChartWidget(id: 2, pieChart: PieChartWeek()),
              PieChartWidget(id: 3, pieChart: PieChartMonth()),
            ],
          ),
        ),
      ],
    );
  }
}
