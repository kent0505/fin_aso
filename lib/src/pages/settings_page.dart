import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/utils.dart';
import '../core/fonts.dart';
import '../widgets/cup_button.dart';
import '../widgets/my_svg.dart';
import '../widgets/title_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10 + getTop(context)),
        const TitleText('Settings'),
        const Spacer(),
        const _Button(id: 1, title: 'Profile'),
        const _Button(id: 2, title: 'Subscription info'),
        const _Button(id: 3, title: 'Privacy Policy'),
        const _Button(id: 4, title: 'Terms of use'),
        const _Button(id: 5, title: 'Support page'),
        const _Button(id: 6, title: 'Share with friends'),
        const Spacer(flex: 2),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(
        bottom: 16,
        left: 32,
        right: 32,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff333333),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupButton(
        onPressed: () {
          if (id == 1) context.push('/profile');
        },
        child: Row(
          children: [
            SizedBox(
              width: 54,
              child: Center(
                child: MySvg('assets/s$id.svg'),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: Fonts.w400,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            const SizedBox(width: 18),
          ],
        ),
      ),
    );
  }
}
