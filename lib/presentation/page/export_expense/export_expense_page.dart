import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_expense_tracker/presentation/page/export_expense/export_expense_json_page.dart';
import 'package:group_expense_tracker/presentation/page/export_expense/export_expense_sheet_page.dart';
import 'package:group_expense_tracker/util/ext/text_util.dart';
import 'package:group_expense_tracker/util/style/app_assets_util.dart';

class ExportExpensePage extends StatefulWidget {
  static const routeName = '/export-expense-page';
  const ExportExpensePage({super.key});

  @override
  State<ExportExpensePage> createState() => _ExportExpensePageState();
}

class _ExportExpensePageState extends State<ExportExpensePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Export Expense"),
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
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Text("Please choose the export method",
                        style: TextUtil(context).urbanist(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10),
                    child: SvgPicture.asset(AppAssetsUtil.imgFinancial,
                        height: 200),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ExportExpenseJsonPage.routeName);
                        },
                        child: Text("1. Export the expense data to Json",
                            style: TextUtil(context).urbanist(
                                fontSize: 17, fontWeight: FontWeight.w500))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ExportExpenseSheetPage.routeName);
                        },
                        child: Text(
                          "2. Export the expense data to Spread sheet",
                          style: TextUtil(context).urbanist(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
