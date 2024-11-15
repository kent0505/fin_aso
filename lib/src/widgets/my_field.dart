import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/fonts.dart';

class MyField extends StatelessWidget {
  const MyField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isNumber = false,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isNumber;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : null,
      inputFormatters: [
        LengthLimitingTextInputFormatter(isNumber ? 6 : 20),
        if (isNumber) FilteringTextInputFormatter.digitsOnly,
      ],
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Color(0xff333333),
        fontSize: 12,
        fontFamily: Fonts.w700,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 24,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xff333333).withOpacity(0.5),
          fontSize: 12,
          fontFamily: Fonts.w700,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xff333333)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xff333333)),
        ),
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        onChanged();
      },
    );
  }
}
