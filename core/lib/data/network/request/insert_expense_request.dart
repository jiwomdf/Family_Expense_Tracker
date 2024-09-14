import 'package:core/util/date_format_util.dart';
import 'package:core/util/firestore_constants.dart';
import 'package:core/util/int_util.dart';
import 'package:core/util/string_util.dart';

class InsertExpenseRequest {
  String? email;
  final String note;
  final int price;
  final String date;
  final String categoryName;
  final String subCategoryName;

  InsertExpenseRequest({
    this.email,
    required this.note,
    required this.price,
    required this.date,
    required this.categoryName,
    required this.subCategoryName,
  });

  factory InsertExpenseRequest.fromJson(Map<String, dynamic> json) =>
      InsertExpenseRequest(
        email: (json["email"] ?? "undefined").toString().toInputFormat(),
        note: (json["note"] ?? "undefined").toString().toInputFormat(),
        price: int.parse(json["price"] ?? 0),
        date: (json["date"] ?? DateTime.now().toDateString("dd MMM yyyy") ?? "")
            .toString()
            .toInputFormat(),
        categoryName:
            (json["categoryName"] ?? "undefined").toString().toInputFormat(),
        subCategoryName:
            (json["subCategoryName"] ?? "undefined").toString().toInputFormat(),
      );

  Map<String, dynamic> toInsertJson() {
    var now = DateTime.now();
    var strYearSplit = date.split("/");
    var dayOfMonth = strYearSplit[0];
    var month = strYearSplit[1];
    var year = strYearSplit[2];

    var timeStamp =
        "${now.hour.addZeroPref()}:${now.minute.addZeroPref()}:${now.second.addZeroPref()} ${now.day.addZeroPref()}/${now.month.addZeroPref()}/${now.year}";

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
    data[ExpenseConstants.status] = "A";
    return data;
  }

  Map<String, dynamic> toJson() {
    var dayOfMonth = date[0];
    var month = date[1];
    var year = date[2];

    var now = DateTime.now();
    var timeStamp =
        "${now.hour.addZeroPref()}:${now.minute.addZeroPref()}:${now.second.addZeroPref()} ${now.day.addZeroPref()}/${now.month.addZeroPref()}/${now.year}";

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
    data[ExpenseConstants.status] = "A";
    return data;
  }
}
