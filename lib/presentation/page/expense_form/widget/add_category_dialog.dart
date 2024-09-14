import 'package:core/domain/model/category_model.dart';
import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/presentation/bloc/category/category_bloc.dart';
import 'package:family_expense_tracker/presentation/widget/text_form_field.dart';
import 'package:family_expense_tracker/util/app_snackbar_util.dart';
import 'package:family_expense_tracker/util/ext/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddCategoryDialog extends StatefulWidget {
  const AddCategoryDialog({super.key});

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  CategoryModel ddlValue = CategoryModel(
    categoryColor: 0xff443a49,
    categoryName: "",
  );
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryUpdated) {
          context.show(S.of(context).categoryInserted);
          Navigator.of(context, rootNavigator: true).pop(ddlValue);
        } else if (state is CategoryError) {
          context.show(state.message);
        }

        return initDialogWidget();
      },
    );
  }

  Widget initDialogWidget() {
    return Dialog(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Text(S.of(context).addCategory,
                      style: TextUtil(context).urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: textFormFieldStyle(
                        context: context, hintText: S.of(context).categoryName),
                    validator: (val) => (val?.isEmpty ?? true)
                        ? S.of(context).categoryCannotBeEmpty
                        : null,
                    onChanged: (val) {
                      setState(() => ddlValue.categoryName = val.toLowerCase());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: BlockPicker(
                    pickerColor: Color(ddlValue.categoryColor),
                    onColorChanged: (color) {
                      setState(() => ddlValue.categoryColor = color.value);
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.pink,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(S.of(context).close),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<CategoryBloc>()
                              .add(UpdateCategoryEvent(CategoryModel(
                                categoryName:
                                    ddlValue.categoryName.toLowerCase(),
                                categoryColor: ddlValue.categoryColor,
                              )));
                        }
                      },
                      child: Text(S.of(context).insert),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
