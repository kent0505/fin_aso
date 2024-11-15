import 'package:flutter/material.dart';

import '../../../core/widgets/others/tab_widget.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: TabWidget(
        titles: [
          'Day',
          'Week',
          'Month',
        ],
        pages: [
          Text('Aaa'),
          Text('Bbb'),
          Text('Ccc'),
        ],
      ),
    );
  }
}
