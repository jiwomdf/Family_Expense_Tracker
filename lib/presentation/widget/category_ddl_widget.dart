import 'package:core/domain/model/category_model.dart';
import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/presentation/bloc/category/category_bloc.dart';
import 'package:family_expense_tracker/util/app_snackbar_util.dart';
import 'package:family_expense_tracker/util/ext/int_util.dart';
import 'package:family_expense_tracker/util/ext/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CategoryDdlWidget extends StatefulWidget {
  final CategoryModel? initialData;
  final ValueChanged<CategoryModel> selectedCategory;

  const CategoryDdlWidget({
    super.key,
    required this.initialData,
    required this.selectedCategory,
  });

  @override
  State<CategoryDdlWidget> createState() => _CategoryDdlWidgetState();
}

class _CategoryDdlWidgetState extends State<CategoryDdlWidget> {
  final getIt = GetIt.instance;
  List<CategoryModel> categories = CategoryModel.emptyList();
  CategoryModel ddlValue =
      CategoryModel(categoryColor: 0xff443a49, categoryName: "");

  @override
  void initState() {
    context.read<CategoryBloc>().add(const GetCategoryEvent());

    ddlValue = widget.initialData ??
        CategoryModel(categoryColor: 0xff443a49, categoryName: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryHasData) {
          categories = state.result;
        } else if (state is CategoryError) {
          context.show(state.message);
        }

        return DropdownButton(
          hint: Row(
            children: [
              SizedBox(
                height: 15,
                child: CircleAvatar(
                    backgroundColor: ddlValue.categoryColor.toColor()),
              ),
              Text((ddlValue.categoryName).ifEmpty(S.of(context).chooseOne)),
            ],
          ),
          items: categories.map((CategoryModel value) {
            return DropdownMenuItem(
                value: value,
                child: Row(
                  children: [
                    SizedBox(
                      height: 15,
                      child: CircleAvatar(
                          backgroundColor: value.categoryColor.toColor()),
                    ),
                    Text(value.categoryName),
                  ],
                ));
          }).toList(),
          onChanged: (value) {
            setState(() {
              ddlValue.categoryName = value?.categoryName ?? "";
              ddlValue.categoryColor = value?.categoryColor ?? 0;
            });
            widget.selectedCategory(ddlValue);
          },
        );
      },
    );
  }
}
