import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fonts.dart';

final theme = ThemeData(
  useMaterial3: false,

  fontFamily: Fonts.w400,
  scaffoldBackgroundColor: const Color(0xffFED600),
  // textSelectionTheme: const TextSelectionThemeData(
  //   cursorColor: AppColors.main,
  //   selectionColor: AppColors.main,
  //   selectionHandleColor: AppColors.main,
  // ),
  // colorScheme: ColorScheme.fromSwatch(
  //   accentColor: AppColors.main, // overscroll indicator color
  // ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40),
      ),
    ),
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
    ),
  ),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: Fonts.w400,
      color: Colors.black,
    ),
    dateTimePickerTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: Fonts.w400,
    ),
  ),
);
