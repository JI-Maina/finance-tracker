import 'package:expense_repository/src/entities/expense_entity.dart';
import 'package:expense_repository/src/models/category.dart';

class Expense {
  String expenseId;
  Category category;
  DateTime date;
  int amount;

  Expense({
    required this.date,
    required this.amount,
    required this.category,
    required this.expenseId,
  });

  ExpenseEntity toEntity() {
    return ExpenseEntity(
      date: date,
      amount: amount,
      category: category,
      expenseId: expenseId,
    );
  }

  static Expense fromEntity(ExpenseEntity entity) {
    return Expense(
      date: entity.date,
      amount: entity.amount,
      category: entity.category,
      expenseId: entity.expenseId,
    );
  }
}
