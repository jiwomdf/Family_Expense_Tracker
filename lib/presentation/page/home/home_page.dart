import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/subcategory/subcategory_bloc.dart';
import 'package:family_expense_tracker/presentation/page/expense_form/expense_form_page.dart';
import 'package:family_expense_tracker/presentation/page/home/widget/card_expense_widget.dart';
import 'package:family_expense_tracker/presentation/page/home/widget/card_income_widget.dart';
import 'package:family_expense_tracker/presentation/page/home/widget/list_expense/expense_widget.dart';
import 'package:family_expense_tracker/presentation/page/home/widget/pie_chart_sub_category_widget.dart';
import 'package:family_expense_tracker/presentation/page/home/widget/pie_chart_widget.dart';
import 'package:family_expense_tracker/presentation/widget/filter_widget.dart';
import 'package:family_expense_tracker/presentation/widget/right_drawer.dart';
import 'package:family_expense_tracker/presentation/widget/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<SubcategoryBloc>().add(const GetSubcategoryWithCacheEvent());
    context.read<ExpenseBloc>().add(const ResetExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: S.of(context).home, showDrawer: true),
      endDrawer: const RightDrawer(),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PieChartSubCategoryWidget(),
                    PieChartWidget(),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardExpenseWidget(),
                      CardIncomeWidget(),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 16, right: 16),
                child: Column(
                  children: [
                    FilterWidget(),
                    ExpenseWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "fab_insert",
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.pushNamed(context, ExpenseFormPage.routeName);
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
