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

  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

  final _amountController = TextEditingController();
  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    @override
    void setState() {
      _selectedDate = pickedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          maxLength: 50,
          onChanged: _saveTitleInput,
          decoration: const InputDecoration(
            label: Text('title'),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text('amount'), prefixText: '\$'),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'no selected'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                print(_enteredTitle);
                print(_amountController.text);
              },
              child: const Text('Save Expense'),
            )
          ],
        )
      ]),
    );
  }
}
