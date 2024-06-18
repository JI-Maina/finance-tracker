import '../entities/entities.dart';

class Category {
  String categoryId;
  String name;
  String icon;
  String color;
  int totalExpense;

  Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.categoryId,
    required this.totalExpense,
  });

  static final empty = Category(
    name: '',
    icon: '',
    color: '',
    categoryId: '',
    totalExpense: 0,
  );

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpense: totalExpense,
      icon: icon,
      color: color,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpense: entity.totalExpense,
      icon: entity.icon,
      color: entity.color,
    );
  }
}
