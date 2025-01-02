class SubCategoryModel {
  String subCategoryId;
  String subCategoryName;
  int subCategoryColor;

  SubCategoryModel({
    required this.subCategoryId,
    required this.subCategoryName,
    required this.subCategoryColor,
  });

  static List<SubCategoryModel> emptyList() {
    return [];
  }
}
