import 'package:flutter/material.dart';

import '../core/fonts.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff333333),
          fontSize: 16,
          fontFamily: Fonts.w700,
        ),
      ),
    );
  }
}
