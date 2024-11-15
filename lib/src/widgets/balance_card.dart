import 'package:flutter/material.dart';

import '../core/fonts.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 26),
          Text(
            'Balance',
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 12,
              fontFamily: Fonts.w400,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '\$ 24,450.89',
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 40,
              fontFamily: Fonts.w700,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              Text(
                'Id:00001',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                  fontFamily: Fonts.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
