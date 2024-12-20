import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/model/model_bloc.dart';
import '../core/database.dart';
import '../core/fonts.dart';
import '../core/utils.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 26),
          const Text(
            'Balance',
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 12,
              fontFamily: Fonts.w400,
            ),
          ),
          const SizedBox(height: 12),
          BlocBuilder<ModelBloc, ModelState>(
            builder: (context, state) {
              return Text(
                '\$ ${formattedNum(getTotalAmount())}',
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 40,
                  fontFamily: Fonts.w700,
                ),
              );
            },
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              Text(
                'Id:$profileId',
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                  fontFamily: Fonts.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
