import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/database.dart';
import '../core/fonts.dart';
import 'cup_button.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          const SizedBox(width: 24),
          CupButton(
            onPressed: () {
              context.push('/profile');
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    File(profileImage),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container();
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                  fontFamily: Fonts.w400,
                ),
              ),
              Text(
                profileName,
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                  fontFamily: Fonts.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
