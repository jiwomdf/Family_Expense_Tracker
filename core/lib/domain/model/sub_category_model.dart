class SubCategoryModel {
  String categoryName;
  int categoryColor;

  SubCategoryModel({
    required this.categoryName,
    required this.categoryColor,
  });

  static List<SubCategoryModel> emptyList() {
    return [];
  }
}
