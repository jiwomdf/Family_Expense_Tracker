class CategoryModel {
  String categoryId;
  String categoryName;
  int categoryColor;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryColor,
  });

  static List<CategoryModel> emptyList() {
    return [];
  }
}
