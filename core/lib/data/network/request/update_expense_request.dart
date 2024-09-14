import 'package:core/util/date_format_util.dart';
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

  factory UpdateExpenseRequest.fromJson(Map<String, dynamic> json) =>
      UpdateExpenseRequest(
        id: json["id"],
        note: (json["note"] ?? "undefined").toString().toInputFormat(),
        price: int.parse(json["price"] ?? 0),
        date: (json["date"] ?? DateTime.now().toDateString("dd MMM yyyy") ?? "")
            .toString()
            .toInputFormat(),
        categoryName:
            (json["categoryName"] ?? "undefined").toString().toInputFormat(),
        subCategoryName:
            (json["subCategoryName"] ?? "undefined").toString().toInputFormat(),
        year: (json["year"] ?? "undefined").toString().toInputFormat(),
        month: (json["month"] ?? "undefined").toString().toInputFormat(),
        dayOfMonth:
            (json["dayOfMonth"] ?? "undefined").toString().toInputFormat(),
        timeStamp:
            (json["timeStamp"] ?? "undefined").toString().toInputFormat(),
        status: (json["status"] ?? "undefined").toString().toInputFormat(),
      );

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
