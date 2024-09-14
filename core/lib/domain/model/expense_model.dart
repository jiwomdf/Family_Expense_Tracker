class ExpenseModel {
  final String id;
  final String email;
  final String note;
  final int price;
  final String date;
  final String categoryName;

  ExpenseModel({
    required this.id,
    required this.email,
    required this.note,
    required this.price,
    required this.date,
    required this.categoryName,
  });
}
