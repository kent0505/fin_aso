import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/model.dart';
import 'database.dart';

int currentTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;
String formattedNum(int num) => NumberFormat('#,###').format(num);
String dateString(DateTime date) => DateFormat('MMM dd yyyy').format(date);
double getTop(BuildContext context) => MediaQuery.of(context).viewPadding.top;

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

String formatCurrentDate() => DateFormat('MMMM dd yyyy').format(DateTime.now());

int getTotalAmount() {
  int inc = 0;
  int exp = 0;
  for (Model model in modelsList) {
    model.expense ? exp += model.amount : inc += model.amount;
  }
  return inc - exp;
}

int nowamount(bool expense) {
  final now = DateTime.now();
  return modelsList.where((model) {
    final date = DateTime.fromMillisecondsSinceEpoch(model.id * 1000);
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day &&
        model.expense == expense;
  }).fold(0, (sum, model) => sum + model.amount);
}

List<double> weekamounts(bool expense) {
  final now = DateTime.now();
  final start = now.subtract(Duration(days: now.weekday - 1));
  List<double> weekly = List.filled(7, 0);
  for (Model model in modelsList) {
    final date = DateTime.fromMillisecondsSinceEpoch(model.id * 1000);
    if (date.isAfter(start.subtract(const Duration(days: 1))) &&
        date.isBefore(start.add(const Duration(days: 7))) &&
        model.expense == expense) {
      int weekdayIndex = date.weekday - 1;
      weekly[weekdayIndex] += model.amount;
    }
  }
  return weekly;
}

List<double> monthamounts(bool expense) {
  final now = DateTime.now();
  final List<double> weekly = List.filled(4, 0.0);
  for (Model model in modelsList) {
    final date = DateTime.fromMillisecondsSinceEpoch(model.id * 1000);
    if (date.year == now.year &&
        date.month == now.month &&
        model.expense == expense) {
      final weekIndex = ((date.day - 1) ~/ 7);
      weekly[weekIndex] += model.amount;
    }
  }
  return weekly;
}
