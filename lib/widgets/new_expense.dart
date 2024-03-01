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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          maxLength: 50,
          onChanged: _saveTitleInput,
          decoration: const InputDecoration(label: Text('title')),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                print(_enteredTitle);
              },
              child: const Text('Save Expense'),
            )
          ],
        )
      ]),
    );
  }
}
