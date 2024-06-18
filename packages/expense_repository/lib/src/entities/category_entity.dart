class CategoryEntity {
  String categoryId;
  String name;
  String icon;
  String color;
  int totalExpense;

  CategoryEntity({
    required this.name,
    required this.icon,
    required this.color,
    required this.categoryId,
    required this.totalExpense,
  });

  Map<String, Object?> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
      'icon': icon,
      'color': color,
      'totalExpense': totalExpense,
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
      name: doc['name'],
      icon: doc['icon'],
      color: doc['color'],
      categoryId: doc['categoryId'],
      totalExpense: doc['totalExpense'],
    );
  }
}
