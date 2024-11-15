import 'package:flutter/material.dart';

import '../../../core/config/fonts.dart';
import '../../../core/utils.dart';
import '../widgets/add_expense_income.dart';
import '../widgets/balance_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        SizedBox(height: 12 + getStatusBar(context)),
        // profile picture
        const SizedBox(height: 12),
        const BalanceCard(),
        const SizedBox(height: 10),
        const Row(
          children: [
            AddExpenseIncome(expense: true),
            SizedBox(width: 36),
            AddExpenseIncome(expense: false),
          ],
        ),
        const SizedBox(height: 24),
        const _Title('Your Friends'),
        const SizedBox(height: 18),
        // friends
        const SizedBox(height: 24),
        const _Title('History'),
        const SizedBox(height: 18),
        // expense income card
        const SizedBox(height: 24),
        const _Title('News'),
        const SizedBox(height: 18),
        // news card
        const SizedBox(height: 18),
        const SizedBox(height: 83),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xff333333),
        fontSize: 16,
        fontFamily: Fonts.w700,
      ),
    );
  }
}
