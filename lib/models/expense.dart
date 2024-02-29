import "package:uuid/uuid.dart";

//final  uuid=Uuid();

class Expense {
  Expense({required this.title, required this.date, required this.amount})
      : id = const Uuid().v4();

  //title  date  id  amount
  final String title;
  final DateTime date;
  final String amount;
  final String id;
}
