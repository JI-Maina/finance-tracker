import 'package:expense_repository/expense_repository.dart';

abstract class ExpenseRepository {
  Future<void> creteCategory(Category category);

  Future<List<Category>> getCategory();

  Future<void> createExpense(Expense expense);
}
