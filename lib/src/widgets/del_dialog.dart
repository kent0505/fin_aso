import 'package:flutter/material.dart';

import '../core/fonts.dart';
import 'cup_button.dart';

class DelDialog extends StatelessWidget {
  const DelDialog({
    super.key,
    required this.title,
    required this.onYes,
  });

  final String title;
  final void Function() onYes;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff333333),
                fontSize: 24,
                fontFamily: Fonts.w700,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 20),
                _Button(
                  title: 'NO',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                _Button(
                  title: 'YES',
                  onPressed: () {
                    Navigator.pop(context);
                    onYes();
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupButton(
      padding: 0,
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff333333),
          fontSize: 16,
          fontFamily: Fonts.w600,
        ),
      ),
    );
  }
}
