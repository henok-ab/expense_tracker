import "package:expense_tracker/models/expense.dart";
import "package:flutter/material.dart";

/*this widget is stateless because only render re genrated data from expensesList class*/
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Text(expenses[index].title));
  }
}
//ListView() used for scrollable only  
//but ListView.builder for both scrollable and on demand