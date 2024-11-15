import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int currentTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;
String formattedNum(int num) => NumberFormat('#,###').format(num);
double getTop(BuildContext context) => MediaQuery.of(context).viewPadding.top;
void logg(Object msg) => dev.log(msg.toString());

String getAsset(String c) {
  if (c == 'Investment') return 'assets/c1.svg';
  if (c == 'Food') return 'assets/c2.svg';
  if (c == 'Transport') return 'assets/c3.svg';
  if (c == 'Procurement') return 'assets/c4.svg';
  if (c == 'Rest') return 'assets/c5.svg';
  if (c == 'Passive') return 'assets/c6.svg';
  if (c == 'Salary') return 'assets/c7.svg';
  if (c == 'Rent') return 'assets/c8.svg';
  if (c == 'Business') return 'assets/c9.svg';
  if (c == 'Freelance') return 'assets/c10.svg';
  if (c == 'Investment ') return 'assets/c11.svg';
  if (c == 'Dividends') return 'assets/c12.svg';
  if (c == 'Royalty') return 'assets/c13.svg';
  return 'assets/c1.svg';
}

List<String> getCat(bool expense) => expense
    ? ['Investment', 'Food', 'Transport', 'Procurement', 'Rest']
    : [
        'Passive',
        'Salary',
        'Rent',
        'Business',
        'Freelance',
        'Investment ',
        'Dividends',
        'Royalty'
      ];
