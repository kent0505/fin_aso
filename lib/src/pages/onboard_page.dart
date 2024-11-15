import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/database.dart';
import '../core/fonts.dart';
import '../widgets/main_button.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int index = 1;

  String getTitle() {
    if (index == 1) return '';
    return '';
  }

  String getDescription() {
    if (index == 1) return '';
    return '';
  }

  void onNext() async {
    if (index == 2) {
      await saveOnb().then(
        (value) {
          if (mounted) context.go('/home');
        },
      );
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getTitle(),
            style: const TextStyle(
              fontSize: 30,
              fontFamily: Fonts.w700,
            ),
          ),
          Text(
            getDescription(),
            style: const TextStyle(
              fontSize: 30,
              fontFamily: Fonts.w400,
            ),
          ),
          MainButton(
            title: 'Go Home',
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}
