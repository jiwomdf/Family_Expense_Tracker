import 'package:core/domain/model/expense_category_model.dart';
import 'package:group_expense_tracker/util/ext/int_util.dart';
import 'package:group_expense_tracker/util/ext/string_util.dart';

class UpdateExpenseScheme {
  static const String id = "id";
  static const String _date = "date";
  static const String _email = "email";
  static const String _note = "note";
  static const String _price = "price";
  static const String _subCategoryName = "subCategoryName";
  static const String _categoryName = "categoryName";
  static const String _year = "year";
  static const String _month = "month";
  static const String _dayOfMonth = "dayOfMonth";
  static const String _timeStamp = "timeStamp";
  static const String _status = "status";

  static Map<String, dynamic> updateExpenseSchemeCollection(
    ExpenseCategoryModel expenseCategoryModel,
  ) {
    var date = expenseCategoryModel.date.split("/");
    var dayOfMonth = date[0];
    var month = date[1];
    var year = date[2];

    var now = DateTime.now();
    var timeStamp =
        "${now.hour.addZeroPref()}:${now.minute.addZeroPref()}:${now.second.addZeroPref()} ${now.day.addZeroPref()}/${now.month.addZeroPref()}/${now.year}";

    final Map<String, dynamic> data = <String, dynamic>{};
    data[id] = expenseCategoryModel.id;
    data[_email] = expenseCategoryModel.email;
    data[_note] = expenseCategoryModel.note;
    data[_price] = expenseCategoryModel.price;
    data[_date] = expenseCategoryModel.date;
    data[_categoryName] = expenseCategoryModel.categoryName;
    data[_subCategoryName] = expenseCategoryModel.subCategoryName;
    data[_year] = year;
    data[_month] = month.addZeroPref();
    data[_dayOfMonth] = dayOfMonth.addZeroPref();
    data[_timeStamp] = timeStamp;
    data[_status] = "A";
    return data;
  }
}
