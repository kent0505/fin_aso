import 'package:flutter/material.dart';

import '../models/finance.dart';
import '../widgets/finance_card.dart';
import '../widgets/title_text.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: financesList.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              const SizedBox(height: 14),
              const TitleText('News'),
              const SizedBox(height: 26),
              FinanceCard(finance: financesList[index]),
            ],
          );
        }
        return FinanceCard(finance: financesList[index]);
      },
    );
  }
}
