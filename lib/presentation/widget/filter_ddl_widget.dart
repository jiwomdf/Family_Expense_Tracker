import 'package:family_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String _ddlMonthStrValue = '';
  int _ddlMonthValue = 0;
  int _ddlYearValue = DateTime.now().year;
  List<Map<String, int>> ddMonths = [
    {"January": 1},
    {"February": 2},
    {"March": 3},
    {"April": 4},
    {"May": 5},
    {"June": 6},
    {"July": 7},
    {"August": 8},
    {"September": 9},
    {"October": 10},
    {"November": 11},
    {"December": 12}
  ];
  List<int> _listYear = [];

  @override
  void initState() {
    super.initState();
    _listYear = generateLastFiveYear();

    var month = DateTime.now().month - 1;
    _ddlMonthStrValue = ddMonths[month].keys.first;
    _ddlMonthValue = month;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        monthDropDown(),
        const Padding(
          padding: EdgeInsets.only(left: 6, right: 6),
          child: SizedBox(),
        ),
        yearDropDown(),
      ],
    );
  }

  List<int> generateLastFiveYear() {
    List<int> listYear = [];
    var curYear = DateTime.now().year;
    for (var year = curYear; year >= curYear - 5; year--) {
      listYear.add(year);
    }
    return listYear;
  }

  void updateExpenseList(int month, int year) {
    context.read<ExpenseBloc>().add(GetExpenseEvent(month, year));
  }

  Widget monthDropDown() {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Theme.of(context).cardColor,
      ),
      child: DropdownButton(
        hint: Text(_ddlMonthStrValue),
        items: ddMonths.map((Map<String, int> value) {
          var monthStr = value.keys.first;
          return DropdownMenuItem(
            value: value,
            child: Text(monthStr),
          );
        }).toList(),
        onChanged: (value) {
          var monthStr = value?.keys.first ?? "";
          var monthVal = value?.values.first ?? 0;
          setState(() {
            _ddlMonthStrValue = monthStr;
            _ddlMonthValue = monthVal;
          });

          updateExpenseList(monthVal, _ddlYearValue);
        },
      ),
    );
  }

  Widget yearDropDown() {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Theme.of(context).cardColor,
      ),
      child: DropdownButton(
        hint: Text(_ddlYearValue.toString()),
        items: _listYear.map((int value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _ddlYearValue = value?.toInt() ?? DateTime.now().year;
          });
          updateExpenseList(_ddlMonthValue, _ddlYearValue);
        },
      ),
    );
  }
}
