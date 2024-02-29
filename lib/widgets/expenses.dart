import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenseList.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    //
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // to show some dummy data
  final List<Expense> _registerdExpenses = [
    Expense(
        title: "flutter course",
        date: DateTime.now(),
        amount: 19.0,
        category: Category.work),
    Expense(
        title: "paris to london",
        date: DateTime.now(),
        amount: 200.0,
        category: Category.travel)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("charts"),
        Expanded(
          child: ExpensesList(expenses: _registerdExpenses),
        ), // use expensesList.dart file this stateless widget
      ]),
    );
  }
}
