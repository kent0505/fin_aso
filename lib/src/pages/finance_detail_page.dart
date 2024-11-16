import 'package:cached_network_image/cached_network_image.dart';
import 'package:fin_aso/src/core/utils.dart';
import 'package:flutter/material.dart';

import '../core/fonts.dart';
import '../models/finance.dart';
import '../widgets/title_text.dart';

class FinanceDetailPage extends StatelessWidget {
  const FinanceDetailPage({
    super.key,
    required this.finance,
  });

  final Finance finance;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const SizedBox(height: 14),
        TitleText(finance.title),
        const SizedBox(height: 25),
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: CachedNetworkImage(
            imageUrl: finance.image,
            height: 200,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return Container();
            },
          ),
        ),
        const SizedBox(height: 4),
        Text(
          dateString(finance.time),
          style: const TextStyle(
            color: Color(0xff333333),
            fontSize: 10,
            fontFamily: Fonts.w400,
          ),
        ),
        const SizedBox(height: 25),
        Text(
          finance.body,
          style: const TextStyle(
            color: Color(0xff333333),
            fontSize: 14,
            fontFamily: Fonts.w400,
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
