import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../core/fonts.dart';
import '../core/utils.dart';
import '../models/finance.dart';
import '../pages/finance_detail_page.dart';
import 'cup_button.dart';
import 'sheet_widget.dart';

class FinanceCard extends StatelessWidget {
  const FinanceCard({
    super.key,
    required this.finance,
  });

  final Finance finance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 1),
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
                body: FinanceDetailPage(finance: finance),
              );
            },
          );
        },
        child: Row(
          children: [
            const SizedBox(width: 20),
            Column(
              children: [
                const SizedBox(height: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: CachedNetworkImage(
                    imageUrl: finance.image,
                    height: 62,
                    width: 62,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Finance',
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 10,
                    fontFamily: Fonts.w700,
                  ),
                ),
                Text(
                  dateString(finance.time),
                  style: const TextStyle(
                    color: Color(0xff333333),
                    fontSize: 8,
                    fontFamily: Fonts.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    finance.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                      fontFamily: Fonts.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    finance.body,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xff333333),
                      fontSize: 10,
                      fontFamily: Fonts.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
