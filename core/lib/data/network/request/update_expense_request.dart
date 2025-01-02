import 'package:core/util/firestore_constants.dart';
import 'package:core/util/string_util.dart';

class UpdateExpenseRequest {
  final String id;
  final String note;
  final int price;
  final String date;
  final String categoryName;
  final String subCategoryName;
  final String year;
  final String month;
  final String dayOfMonth;
  final String timeStamp;
  final String status;

  UpdateExpenseRequest({
    required this.id,
    required this.note,
    required this.price,
    required this.date,
    required this.categoryName,
    required this.subCategoryName,
    required this.year,
    required this.month,
    required this.dayOfMonth,
    required this.timeStamp,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ExpenseConstants.note] = note;
    data[ExpenseConstants.price] = price;
    data[ExpenseConstants.date] = date;
    data[ExpenseConstants.categoryName] = categoryName;
    data[ExpenseConstants.subCategoryName] = subCategoryName;
    data[ExpenseConstants.year] = year;
    data[ExpenseConstants.month] = month.addZeroPref();
    data[ExpenseConstants.dayOfMonth] = dayOfMonth.addZeroPref();
    data[ExpenseConstants.timeStamp] = timeStamp;
    data[ExpenseConstants.status] = status;
    return data;
  }
}
