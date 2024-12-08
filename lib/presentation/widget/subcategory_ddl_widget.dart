import 'package:core/domain/model/sub_category_model.dart';
import 'package:family_expense_tracker/presentation/bloc/subcategory/subcategory_bloc.dart';
import 'package:family_expense_tracker/util/app_snackbar_util.dart';
import 'package:family_expense_tracker/util/ext/int_util.dart';
import 'package:family_expense_tracker/util/ext/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryDdlWidget extends StatefulWidget {
  final SubCategoryModel? _initialData;
  final ValueChanged<SubCategoryModel> selectedCategory;

  const SubCategoryDdlWidget({
    super.key,
    required SubCategoryModel? initialData,
    required this.selectedCategory,
  }) : _initialData = initialData;

  @override
  State<SubCategoryDdlWidget> createState() => _SubCategoryDdlWidgetState();
}

class _SubCategoryDdlWidgetState extends State<SubCategoryDdlWidget> {
  List<SubCategoryModel> _subcategories = SubCategoryModel.emptyList();
  SubCategoryModel _ddlValue = SubCategoryModel(
    categoryColor: 0xff443a49,
    categoryName: "",
  );

  @override
  void initState() {
    context.read<SubcategoryBloc>().add(const GetSubcategoryEvent());
    _ddlValue = widget._initialData ??
        SubCategoryModel(categoryColor: 0xff443a49, categoryName: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoryBloc, SubcategoryState>(
      builder: (context, state) {
        if (state is SubcategoryHasData) {
          _subcategories = state.result;
        } else if (state is SubcategoryError) {
          context.show(state.message);
        }

        return DropdownButton(
          hint: Row(
            children: [
              SizedBox(
                height: 15,
                child: CircleAvatar(
                    backgroundColor: _ddlValue.categoryColor.toColor()),
              ),
              Text((_ddlValue.categoryName).ifEmpty("Choose one")),
            ],
          ),
          items: _subcategories.map((SubCategoryModel value) {
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
              _ddlValue.categoryName = value?.categoryName ?? "";
              _ddlValue.categoryColor = value?.categoryColor ?? 0;
            });
            widget.selectedCategory(_ddlValue);
          },
        );
      },
    );
  }
}
