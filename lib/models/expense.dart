import "package:uuid/uuid.dart";

//final  uuid=Uuid();  we can use this method for id
enum Category { work, leisure, travel, food }

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
}
