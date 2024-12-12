import 'package:core/domain/model/sub_category_model.dart';
import 'package:core/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:group_expense_tracker/presentation/bloc/subcategory/subcategory_bloc.dart';
import 'package:group_expense_tracker/presentation/widget/devider.dart';
import 'package:group_expense_tracker/util/ext/date_util.dart';
import 'package:group_expense_tracker/util/ext/int_util.dart';
import 'package:group_expense_tracker/util/ext/string_util.dart';
import 'package:group_expense_tracker/util/style/app_snackbar_util.dart';

class FilterWidget extends StatefulWidget {
  static const String _defaultSubCategory = "All subCategory";

  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String _ddlMonthStrValue = '';
  int _ddlMonthValue = 1;
  int _ddlYearValue = DateTime.now().year;
  final SubCategoryModel _ddlSubCategoryValue = SubCategoryModel(
    categoryColor: 0xff443a49,
    categoryName: FilterWidget._defaultSubCategory,
  );

  List<int> _listYear = [];
  final List<SubCategoryModel> _subCategoryList = [];

  @override
  void initState() {
    super.initState();
    _listYear = generateLastFiveYear();

    var month = DateTime.now().month;
    _ddlMonthStrValue = ddMonths[month - 1].keys.first;
    _ddlMonthValue = month;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          monthDropDown(),
          devider(),
          yearDropDown(),
          devider(),
          categoryDropDown(),
        ],
      ),
    );
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
          return DropdownMenuItem(value: value, child: Text(monthStr));
        }).toList(),
        onChanged: (value) {
          var monthStr = value?.keys.first ?? "";
          var monthVal = value?.values.first ?? 0;
          setState(() {
            _ddlMonthStrValue = monthStr;
            _ddlMonthValue = monthVal;
          });
          _updateExpenseList(
            monthVal,
            _ddlYearValue,
            _ddlSubCategoryValue.categoryName,
          );
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
          return DropdownMenuItem(value: value, child: Text(value.toString()));
        }).toList(),
        onChanged: (value) {
          setState(() {
            _ddlYearValue = value?.toInt() ?? DateTime.now().year;
          });
          _updateExpenseList(
            _ddlMonthValue,
            _ddlYearValue,
            _ddlSubCategoryValue.categoryName,
          );
        },
      ),
    );
  }

  Widget categoryDropDown() {
    return BlocBuilder<SubcategoryBloc, SubcategoryState>(
      builder: (context, state) {
        if (state is SubcategoryHasData) {
          _subCategoryList.clear();
          _subCategoryList.add(SubCategoryModel(
            categoryColor: 0xff443a49,
            categoryName: FilterWidget._defaultSubCategory,
          ));
          _subCategoryList.addAll(state.result);
        } else if (state is SubcategoryError) {
          context.show(state.message);
        }

        return DropdownButton(
          hint: Row(
            children: [
              SizedBox(
                height: 15,
                child: CircleAvatar(
                    backgroundColor:
                        _ddlSubCategoryValue.categoryColor.toColor()),
              ),
              Text(_ddlSubCategoryValue.categoryName
                  .ifNullOrEmpty("SubCategory")),
            ],
          ),
          items: _subCategoryList.map((SubCategoryModel value) {
            return DropdownMenuItem(
                value: value,
                child: Row(
                  children: [
                    SizedBox(
                      height: 15,
                      child: CircleAvatar(
                          backgroundColor: value.categoryColor.toColor()),
                    ),
                    Text(value.categoryName, overflow: TextOverflow.ellipsis),
                  ],
                ));
          }).toList(),
          onChanged: (value) {
            setState(() {
              _ddlSubCategoryValue.categoryColor =
                  value?.categoryColor ?? subCategoryDefaultColor;
              _ddlSubCategoryValue.categoryName = value?.categoryName ?? "";
            });
            _updateExpenseList(
              _ddlMonthValue,
              _ddlYearValue,
              _ddlSubCategoryValue.categoryName,
            );
          },
        );
      },
    );
  }

  void _updateExpenseList(int month, int year, String subCategory) {
    var selectedSubCategory = "";
    if (FilterWidget._defaultSubCategory != subCategory) {
      selectedSubCategory = subCategory;
    }
    context
        .read<ExpenseBloc>()
        .add(GetExpenseEvent(month, year, selectedSubCategory));
  }
}
