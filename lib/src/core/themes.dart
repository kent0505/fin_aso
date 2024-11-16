import 'package:flutter/material.dart';

import 'fonts.dart';

final theme = ThemeData(
  fontFamily: Fonts.w400,
  useMaterial3: false,
  scaffoldBackgroundColor: const Color(0xffFED600),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(18))),
  ),
);
