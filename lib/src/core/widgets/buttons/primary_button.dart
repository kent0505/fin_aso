import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../config/fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.width,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 45,
          width: width,
          decoration: BoxDecoration(
            color: state is ButtonInitial
                ? const Color(0xff333333)
                : const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(18),
          ),
          child: CupertinoButton(
            onPressed: state is ButtonInitial ? onPressed : null,
            padding: EdgeInsets.zero,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: Fonts.w700,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
