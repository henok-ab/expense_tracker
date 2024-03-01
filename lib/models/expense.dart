import "package:uuid/uuid.dart";
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// utility object      dateformat is a class provided by intl
//  ymd() is one of spacial constuctor among many.
final formatter = DateFormat.yMd();

//final  uuid=Uuid();  we can use this method for id
enum Category { work, leisure, travel, food }

//build map of icons for expenses Category use the in expenses_item
const categoryIcon = {
  Category.food: Icons.dinner_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.date,
      required this.amount,
      required this.category})
      : id = const Uuid().v4();

  //title  date  id  amount
  final String title;
  final DateTime date;
  final double amount;
  final String id;
  final Category category;

  //getter method for date and formatter
  String get formattedDate {
    return formatter.format(date);
  }
}
