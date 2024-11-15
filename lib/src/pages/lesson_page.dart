import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../core/fonts.dart';
import '../models/lesson.dart';
import '../core/utils.dart';
import '../widgets/main_button.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  int index = 0;

  void onNext() {
    setState(() {
      if (index == 5) {
        index = 0;
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        SizedBox(height: 10 + getTop(context)),
        Center(
          child: Container(
            height: 38,
            width: 206,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Finance Lessons',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 22,
                  fontFamily: Fonts.w700,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Container(
            height: 32,
            width: 126,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Lesson ${index + 1}',
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 22,
                  fontFamily: Fonts.w400,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        DottedBorder(
          borderPadding: const EdgeInsets.symmetric(horizontal: 14),
          padding: const EdgeInsets.all(1),
          borderType: BorderType.RRect,
          radius: const Radius.circular(8),
          dashPattern: const [10, 10],
          color: Colors.black,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                lessonsList[index].title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 24,
                  fontFamily: Fonts.w600,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          lessonsList[index].content,
          style: const TextStyle(
            color: Color(0xff333333),
            fontSize: 14,
            fontFamily: Fonts.w700,
          ),
        ),
        const SizedBox(height: 60),
        MainButton(
          title: 'Next',
          onPressed: onNext,
        ),
        const SizedBox(height: 150),
      ],
    );
  }
}
