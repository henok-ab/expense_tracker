import 'dart:ffi';

import 'package:flutter/material.dart';
import "package:expense_tracker/models/expense.dart";

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _enteredTitle = '';
  Category _selectedCategory = Category.leisure;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    await showDatePicker(
            context: context,
            initialDate: now,
            firstDate: firstDate,
            lastDate: now)
        .then((value) => setState(
              () {
                _selectedDate = value;
              },
            ));
  }

  void _submitNewExpense() {
    final EnteredTitle = _titleController.text;
    final EnteredAmount = double.tryParse(_amountController
        .text); // this for tryParse('helloworld') => null  or tryParse('23')=> 23

    bool amountIsInValid = EnteredAmount == null || EnteredAmount <= 0;
    if (EnteredTitle.trim().isEmpty ||
        amountIsInValid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          // title content action
          title: const Text('input invalid'),
          content: const Text(
              'please input valid  title, amount, date and catagory'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('okey'),
            )
          ],
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          maxLength: 50,
          controller: _titleController,
          decoration: const InputDecoration(
            label: Text('Title'),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text('Amount'), prefixText: '\$'),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate != null
                      ? formatter.format(_selectedDate!)
                      : 'no selected'),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((e) => DropdownMenuItem(
                        value: e, child: Text(e.name.toString().toUpperCase())))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                }),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('cancel'),
            ),
            ElevatedButton(
              onPressed: _submitNewExpense,
              child: const Text('Save Expense'),
            )
          ],
        )
      ]),
    );
  }
}
