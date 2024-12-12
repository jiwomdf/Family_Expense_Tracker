import 'package:flutter/material.dart';
import 'package:group_expense_tracker/util/style/app_color_util.dart';
import 'package:intl/intl.dart';

extension IntUtil on int {
  String? toRupiah() {
    var formatter = NumberFormat('##,###,###.##', 'en_US');
    return formatter.format(this);
  }

  Color toColor() {
    try {
      return Color(this);
    } catch (ex) {
      return AppColors.purple.purplePrimary;
    }
  }

  String addZeroPref() {
    var strLength = toString().length;
    if (strLength < 2) {
      return "0$this";
    } else {
      return "$this";
    }
  }
}
