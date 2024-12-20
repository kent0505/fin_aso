import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/fonts.dart';
import '../core/utils.dart';
import '../blocs/model/model_bloc.dart';
import '../models/finance.dart';
import '../widgets/cup_button.dart';
import '../widgets/add_expense_income.dart';
import '../widgets/balance_card.dart';
import '../widgets/finance_card.dart';
import '../widgets/friends_widget.dart';
import '../widgets/history_card.dart';
import '../widgets/no_data.dart';
import '../widgets/sheet_widget.dart';
import '../widgets/welcome_widget.dart';
import 'finance_page.dart';
import 'history_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 12 + getTop(context)),
        const WelcomeWidget(),
        const SizedBox(height: 12),
        const BalanceCard(),
        const SizedBox(height: 10),
        const Row(
          children: [
            SizedBox(width: 24),
            AddExpenseIncome(expense: true),
            SizedBox(width: 36),
            AddExpenseIncome(expense: false),
            SizedBox(width: 24),
          ],
        ),
        const SizedBox(height: 24),
        const _Title('Your Friends'),
        const SizedBox(height: 18),
        const FriendsWidget(),
        const SizedBox(height: 24),
        const _Title(
          'History',
          body: HistoryPage(),
        ),
        const SizedBox(height: 18),
        BlocBuilder<ModelBloc, ModelState>(
          builder: (context, state) {
            if (state is ModelsLoaded) {
              if (state.models.isNotEmpty) {
                return HistoryCard(model: state.models[0]);
              } else {
                return const NoData();
              }
            }
            return Container();
          },
        ),
        const SizedBox(height: 6),
        const _Title(
          'News',
          body: FinancePage(),
        ),
        const SizedBox(height: 18),
        FinanceCard(finance: financesList[0]),
        const SizedBox(height: 18),
        const SizedBox(height: 83),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(
    this.title, {
    this.body,
  });

  final String title;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 24),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff333333),
            fontSize: 16,
            fontFamily: Fonts.w700,
          ),
        ),
        if (body != null) ...[
          const Spacer(),
          CupButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SheetWidget(body: body);
                },
              );
            },
            minSize: 20,
            child: const Text(
              'See all',
              style: TextStyle(
                color: Color(0xff333333),
                fontSize: 12,
                fontFamily: Fonts.w700,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(width: 24),
        ],
      ],
    );
  }
}
