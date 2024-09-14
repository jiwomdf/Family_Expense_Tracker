import 'package:core/domain/model/sub_category_model.dart';
import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/presentation/bloc/subcategory/subcategory_bloc.dart';
import 'package:family_expense_tracker/util/app_snackbar_util.dart';
import 'package:family_expense_tracker/util/ext/int_util.dart';
import 'package:family_expense_tracker/util/ext/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SubCategoryDdlWidget extends StatefulWidget {
  final SubCategoryModel? initialData;
  final ValueChanged<SubCategoryModel> selectedCategory;

  const SubCategoryDdlWidget({
    super.key,
    required this.initialData,
    required this.selectedCategory,
  });

  @override
  State<SubCategoryDdlWidget> createState() => _SubCategoryDdlWidgetState();
}

class _SubCategoryDdlWidgetState extends State<SubCategoryDdlWidget> {
  final getIt = GetIt.instance;
  List<SubCategoryModel> subcategories = SubCategoryModel.emptyList();
  SubCategoryModel ddlValue = SubCategoryModel(
    categoryColor: 0xff443a49,
    categoryName: "",
  );

  @override
  void initState() {
    context.read<SubcategoryBloc>().add(const GetSubcategoryEvent());
    ddlValue = widget.initialData ??
        SubCategoryModel(categoryColor: 0xff443a49, categoryName: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoryBloc, SubcategoryState>(
      builder: (context, state) {
        if (state is SubcategoryHasData) {
          subcategories = state.result;
        } else if (state is SubcategoryError) {
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
          items: subcategories.map((SubCategoryModel value) {
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
