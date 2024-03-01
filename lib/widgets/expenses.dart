import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_List/expense_List.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
        category: Category.travel),
    Expense(
        title: "paris to london",
        date: DateTime.now(),
        amount: 200.0,
        category: Category.travel),
    Expense(
        title: "paris to london",
        date: DateTime.now(),
        amount: 200.0,
        category: Category.travel),
    Expense(
        title: "paris to london",
        date: DateTime.now(),
        amount: 200.0,
        category: Category.travel),
    Expense(
        title: "paris to london",
        date: DateTime.now(),
        amount: 200.0,
        category: Category.travel),
    Expense(
        title: "paris to london",
        date: DateTime.now(),
        amount: 200.0,
        category: Category.travel),
    Expense(
        title: "paris to london",
        date: DateTime.now(),
        amount: 200.0,
        category: Category.travel),
    Expense(
        title: "paris to london",
        date: DateTime.now(),
        amount: 200.0,
        category: Category.travel),
    Expense(
        title: "paris to london",
        date: DateTime.now(),
        amount: 200.0,
        category: Category.travel),
    Expense(
        title: "paris to london",
        date: DateTime.now(),
        amount: 200.0,
        category: Category.travel)
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(children: [
        const Text("charts"),
        Expanded(
          child: ExpensesList(expenses: _registerdExpenses),
        ), // use expensesList.dart file this stateless widget
      ]),
    );
  }
}
