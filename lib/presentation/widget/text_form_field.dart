import 'package:family_expense_tracker/util/style/app_color_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

InputDecoration textFormFieldStyle({
  required BuildContext context,
  required String hintText,
}) =>
    InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 14.0, color: AppColors.grey.lightGray),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.teal,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).cardColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).cardColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.red.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).cardColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      fillColor: Theme.of(context).cardColor,
      filled: true,
      contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
    );

TextInputFormatter textInputFormatter() {
  return TextInputFormatter.withFunction(
      (TextEditingValue oldValue, TextEditingValue newValue) {
    var formatter = NumberFormat('##,###,###.##', 'en_US');
    var value = formatter.tryParse(newValue.text) ?? 0;

    if (newValue.text.endsWith('.') &&
        '.'.allMatches(newValue.text).length == 1) {
      return newValue;
    }

    if (kIsWeb) {
      return TextEditingValue(text: value.toString());
    } else {
      return TextEditingValue(text: formatter.format(value));
    }
  });
}
