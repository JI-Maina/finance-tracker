import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/src/entities/entities.dart';
import 'package:expense_repository/src/models/category.dart';

class ExpenseEntity {
  String expenseId;
  Category category;
  DateTime date;
  int amount;

  ExpenseEntity({
    required this.date,
    required this.amount,
    required this.category,
    required this.expenseId,
  });

  Map<String, Object?> toDocument() {
    return {
      'date': date,
      'amount': amount,
      'category': category.toEntity().toDocument(),
      'expenseId': expenseId,
    };
  }

  static ExpenseEntity fromDocument(Map<String, dynamic> doc) {
    return ExpenseEntity(
      amount: doc['amount'],
      expenseId: doc['expenseId'],
      date: (doc['date'] as Timestamp).toDate(),
      category:
          Category.fromEntity(CategoryEntity.fromDocument(doc['category'])),
    );
  }
}
