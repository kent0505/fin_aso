import 'package:flutter/material.dart';

import '../core/fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xff333333),
          fontSize: 22,
          fontFamily: Fonts.w700,
        ),
      ),
    );
  }
}
