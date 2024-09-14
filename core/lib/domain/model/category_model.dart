class CategoryModel {
  String categoryName;
  int categoryColor;

  CategoryModel({
    required this.categoryName,
    required this.categoryColor,
  });

  static List<CategoryModel> emptyList() {
    return [];
  }
}
