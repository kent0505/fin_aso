import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/model.dart';
import 'database.dart';

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

String getFormattedCurrentDate() {
  final DateTime now = DateTime.now();
  return DateFormat('MMMM dd yyyy').format(now);
}

int getTotalAmount() {
  int incomes = 0;
  int expenses = 0;
  for (Model model in modelsList) {
    model.expense ? expenses += model.amount : incomes += model.amount;
  }
  return incomes - expenses;
}

int getTodayAmount(bool expense) {
  final today = DateTime.now();
  return modelsList.where((model) {
    final date = DateTime.fromMillisecondsSinceEpoch(model.id * 1000);
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day &&
        model.expense == expense;
  }).fold(0, (sum, model) => sum + model.amount);
}

List<double> getWeekAmounts(bool expense) {
  final now = DateTime.now();
  final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  List<double> weeklyAmounts = List.filled(7, 0);
  for (Model model in modelsList) {
    final date = DateTime.fromMillisecondsSinceEpoch(model.id * 1000);
    if (date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
        date.isBefore(startOfWeek.add(const Duration(days: 7))) &&
        model.expense == expense) {
      int weekdayIndex = date.weekday - 1;
      weeklyAmounts[weekdayIndex] += model.amount;
    }
  }
  return weeklyAmounts;
}

List<double> getMonthAmounts(bool expense) {
  final today = DateTime.now();
  final List<double> weeklyAmounts = List.filled(4, 0.0);
  for (Model model in modelsList) {
    final date = DateTime.fromMillisecondsSinceEpoch(model.id * 1000);
    if (date.year == today.year &&
        date.month == today.month &&
        model.expense == expense) {
      final weekIndex = ((date.day - 1) ~/ 7);
      weeklyAmounts[weekIndex] += model.amount;
    }
  }
  return weeklyAmounts;
}
