import 'package:flutter/material.dart';

import '../core/fonts.dart';
import '../core/utils.dart';
import 'cup_button.dart';
import 'my_svg.dart';

class CatCard extends StatelessWidget {
  const CatCard({
    super.key,
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final String title;
  final String current;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          width: 1,
          color: const Color(0xff333333),
        ),
      ),
      child: CupButton(
        onPressed: () {
          onPressed(title);
        },
        minSize: 36,
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Center(
                child: MySvg(getAsset(title)),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                  fontFamily: Fonts.w600,
                ),
              ),
            ),
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    title == current ? const Color(0xff333333) : Colors.white,
                border: Border.all(
                  width: 1,
                  color: const Color(0xff333333),
                ),
              ),
            ),
            const SizedBox(width: 14),
          ],
        ),
      ),
    );
  }
}
