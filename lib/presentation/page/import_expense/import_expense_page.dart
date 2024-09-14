import 'dart:convert';

import 'package:core/data/network/request/insert_expense_request.dart';
import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:family_expense_tracker/util/app_color_util.dart';
import 'package:family_expense_tracker/util/ext/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportExpensePage extends StatefulWidget {
  static const routeName = '/import-expense-page';
  final String _markdownData = """
{
  "email" : "email_content"
  "note" : "note_content"
  "price" : "price_content"
  "date" : "date_content"
  "categoryName" : "categoryName_content"
  "subCategoryName" : "sub_content"
}
""";

  const ImportExpensePage({super.key});

  @override
  State<ImportExpensePage> createState() => _ImportExpensePageState();
}

class _ImportExpensePageState extends State<ImportExpensePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).importExpense),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(S.of(context).step1CreateDatajsonFile,
                          style: TextUtil(context).urbanist(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 8, right: 8),
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: "${S.of(context).createAFileName} ",
                              style: TextUtil(context).urbanist(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: S.of(context).datajson,
                              style: TextUtil(context).urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blue.oceanBlue,
                              )),
                          TextSpan(
                              text: S
                                  .of(context)
                                  .thenMakeSureToFillTheJsonFormatLikeThis,
                              style: TextUtil(context).urbanist(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 8),
                      child: Text(widget._markdownData),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                          S
                              .of(context)
                              .step2PlaceTheDatajsonFileInTheAssetsimportFolder,
                          style: TextUtil(context).urbanist(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 8, right: 8),
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: "${S.of(context).placeYourJsonFileIn} ",
                              style: TextUtil(context).urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                          TextSpan(
                              text: S.of(context).assetsimportdatajsonNn,
                              style: TextUtil(context).urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blue.oceanBlue,
                              )),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(S.of(context).step3PressThisImportButtonBelow,
                          style: TextUtil(context).urbanist(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 8, right: 8),
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: S
                                  .of(context)
                                  .ifTheAboveRequirementAlreadyCompletePressTheBelowButton,
                              style: TextUtil(context).urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                        ]),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              importData();
                            },
                            child: Text(
                                S.of(context).importDatajsonFromAssetsimport)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> importData() async {
    var listBatchExpense = await parseJsonFromAssets("assets/import/data.json");

    if (mounted) {
      context
          .read<ExpenseBloc>()
          .add(InsertBatchExpenseEvent(listBatchExpense));
    }
  }

  Future<List<InsertExpenseRequest>> parseJsonFromAssets(
      String assetsPath) async {
    var data = await rootBundle.loadString(assetsPath);
    List<dynamic> jsonList = json.decode(data);
    List<InsertExpenseRequest> items = [];

    for (var i = 0; i < jsonList.length; i++) {
      var json = jsonList[i];
      var item = InsertExpenseRequest.fromJson(json);

      items.add(item);
    }

    return items;
  }
}
