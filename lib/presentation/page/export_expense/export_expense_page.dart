import 'dart:convert';

import 'package:core/domain/model/expense_category_model.dart';
import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:family_expense_tracker/util/app_snackbar_util.dart';
import 'package:family_expense_tracker/util/ext/text_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart' as html;

class ExportExpensePage extends StatefulWidget {
  static const routeName = '/export-expense-page';
  const ExportExpensePage({super.key});

  @override
  State<ExportExpensePage> createState() => _ExportExpensePageState();
}

class _ExportExpensePageState extends State<ExportExpensePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(
      builder: (context, state) {
        if (state is ExpenseInitiated) {
        } else if (state is ExpenseLoading) {
          return const Row();
        } else if (state is ExpenseHasData) {
          exportData(state.result, "export_expense.json");
          context.read<ExpenseBloc>().add(const ResetExpenseEvent());
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).exportExpense),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Text(S.of(context).exportTheExpenseData,
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
                                    .clickTheButtonBelowToExportTheExpenseData,
                                style: TextUtil(context).urbanist(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (kIsWeb) {
                              context
                                  .read<ExpenseBloc>()
                                  .add(const GetAllExpenseEvent());
                            } else {
                              context.show(S
                                  .of(context)
                                  .theFeatureCurrentlyOnlyWorksOnWeb);
                            }
                          },
                          child: Text(S.of(context).exportTheDownloadExpense)),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void exportData(List<ExpenseCategoryModel> jsonData, String fileName) {
    final buffer = StringBuffer();

    buffer.writeln('[');
    for (var i = 0; i < jsonData.length; i++) {
      var action = jsonData[i];
      var jsonPretty = prettyJson(action.toJson());
      buffer.writeln('$jsonPretty,');
    }
    buffer.writeln(']');

    html.AnchorElement()
      ..href = '${Uri.dataFromString(
        buffer.toString(),
        mimeType: 'application/json',
        encoding: utf8,
      )}'
      ..download = fileName
      ..style.display = 'none'
      ..click();
  }

  String prettyJson(dynamic json) {
    var spaces = ' ' * 4;
    var encoder = JsonEncoder.withIndent(spaces);
    return encoder.convert(json);
  }
}
