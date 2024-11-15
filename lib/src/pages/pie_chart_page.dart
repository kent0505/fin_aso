import 'package:flutter/material.dart';

import '../core/utils.dart';
import '../widgets/tab_widget.dart';
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
          child: TabWidget(
            titles: [
              'Day',
              'Week',
              'Month',
            ],
            pages: [
              PieChartWidget(),
              PieChartWidget(),
              PieChartWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
