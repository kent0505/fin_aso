import 'package:flutter/material.dart';

import '../core/fonts.dart';
import 'cup_button.dart';
import 'my_svg.dart';
import '../pages/add_page.dart';
import 'sheet_widget.dart';

class AddExpenseIncome extends StatelessWidget {
  const AddExpenseIncome({
    super.key,
    required this.expense,
  });

  final bool expense;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 67,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: CupButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SheetWidget(
                  body: AddPage(expense: expense),
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                expense ? 'Expense' : 'Income',
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 14,
                  fontFamily: Fonts.w400,
                ),
              ),
              const SizedBox(width: 6),
              MySvg(expense ? 'assets/add1.svg' : 'assets/add2.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
