import 'package:flutter/material.dart';

import '../../../core/config/fonts.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/svg_widget.dart';
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
        child: CuperButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const SheetWidget(
                  body: Column(
                    children: [],
                  ),
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
              SvgWidget(expense ? 'assets/add1.svg' : 'assets/add2.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
