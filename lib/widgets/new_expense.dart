import 'package:flutter/material.dart';

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
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration:
              const InputDecoration(label: Text('amount'), prefixText: '\$'),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
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
