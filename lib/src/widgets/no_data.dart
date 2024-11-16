import 'package:flutter/material.dart';

import '../core/fonts.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    this.expanded = true,
  });

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No data.',
        style: TextStyle(
          color: Color(0xff333333),
          fontSize: 12,
          fontFamily: Fonts.w700,
        ),
      ),
    );
  }
}
