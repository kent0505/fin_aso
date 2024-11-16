import 'package:flutter/material.dart';

import '../core/fonts.dart';
import '../models/model.dart';
import '../core/utils.dart';
import 'cup_button.dart';
import 'my_svg.dart';
import '../pages/edit_page.dart';
import 'sheet_widget.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.model,
  });

  final Model model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      margin: const EdgeInsets.only(
        bottom: 18,
        left: 24,
        right: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 7,
          ),
        ],
      ),
      child: CupButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SheetWidget(
                body: EditPage(model: model),
              );
            },
          );
        },
        child: Row(
          children: [
            const SizedBox(width: 12),
            MySvg(model.expense ? 'assets/add1.svg' : 'assets/add2.svg'),
            const SizedBox(width: 10),
            Container(
              width: 1,
              height: 37,
              color: const Color(0xffFED600),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 32,
              width: 32,
              child: MySvg(
                getAsset(model.category),
                height: 32,
                width: 32,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 1,
              height: 37,
              color: const Color(0xffFED600),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: const TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                      fontFamily: Fonts.w400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xffFED600),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            model.category,
                            style: const TextStyle(
                              color: Color(0xff333333),
                              fontSize: 14,
                              fontFamily: Fonts.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xffFED600),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            model.expense ? 'Expense' : 'Income',
                            style: const TextStyle(
                              color: Color(0xff333333),
                              fontSize: 14,
                              fontFamily: Fonts.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              '\$${model.amount}',
              style: const TextStyle(
                color: Color(0xff333333),
                fontSize: 18,
                fontFamily: Fonts.w400,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
