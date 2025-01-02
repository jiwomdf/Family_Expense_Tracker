import 'package:core/util/date_format_util.dart';
import 'package:core/util/firestore_constants.dart';
import 'package:core/util/string_util.dart';

class InsertExpenseRequest {
  String? email;
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

  InsertExpenseRequest({
    this.email,
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

  factory InsertExpenseRequest.fromJson(Map<String, dynamic> json) =>
      InsertExpenseRequest(
        email: (json["email"] ?? "").toString().toInputFormat(),
        note: (json["note"] ?? "").toString().toInputFormat(),
        price: int.parse(json["price"] ?? 0),
        date: (json["date"] ??
                DateTime.now().toDateString(DateFormatUtil.ddMMMyyyy) ??
                "")
            .toString()
            .toInputFormat(),
        categoryName: (json["categoryName"] ?? "").toString().toInputFormat(),
        subCategoryName:
            (json["subCategoryName"] ?? "").toString().toInputFormat(),
        year: (json["year"] ?? "").toString().toInputFormat(),
        month: (json["month"] ?? "").toString().toInputFormat(),
        dayOfMonth: (json["dayOfMonth"] ?? "").toString().toInputFormat(),
        timeStamp: (json["timeStamp"] ?? "").toString().toInputFormat(),
        status: (json["status"] ?? "").toString().toInputFormat(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ExpenseConstants.email] = email;
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
