import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/button/button_bloc.dart';
import '../core/fonts.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.width,
    this.alwaysActive = false,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final bool alwaysActive;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return alwaysActive
        ? Container(
            height: 45,
            width: width,
            decoration: BoxDecoration(
              color: const Color(0xff333333),
              borderRadius: BorderRadius.circular(18),
            ),
            child: CupertinoButton(
              onPressed: onPressed,
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
          )
        : BlocBuilder<ButtonBloc, ButtonState>(
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
