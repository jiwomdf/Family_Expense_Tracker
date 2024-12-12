import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/generated/l10n.dart';
import 'package:group_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:group_expense_tracker/util/ext/color_util.dart';
import 'package:group_expense_tracker/util/ext/int_util.dart';
import 'package:group_expense_tracker/util/ext/text_util.dart';
import 'package:group_expense_tracker/util/style/app_color_util.dart';
import 'package:shimmer/shimmer.dart';

class CardIncomeWidget extends StatefulWidget {
  const CardIncomeWidget({super.key});

  @override
  State<CardIncomeWidget> createState() => _CardIncomeWidgetState();
}

class _CardIncomeWidgetState extends State<CardIncomeWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(builder: (context, state) {
      var budget = 5000000;
      var totalExpense = 0;
      if (state is ExpenseInitiated) {
        return const Row();
      } else if (state is ExpenseLoading) {
        return showExpenseShimmer();
      } else if (state is ExpenseHasData) {
        for (var action in state.result) {
          totalExpense += action.price;
        }
      }

      return Container(
        width: 160,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.green,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(S.of(context).budgetMonth,
                  style: TextUtil(context).urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white.primary,
                  )),
              Text("Rp ${(budget - totalExpense).toRupiah()}",
                  style: TextUtil(context).urbanist(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white.primary,
                  )),
              Text(
                "Budget Rp. ${budget.toRupiah()}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(color: AppColors.white.primary, fontSize: 13),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget showExpenseShimmer() {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).cardColor,
      highlightColor: darken(Theme.of(context).cardColor, .05),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.black.primary,
                ),
                height: 15,
                width: 140),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.black.primary,
                ),
                height: 15,
                width: 140),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.black.primary,
                ),
                height: 15,
                width: 140),
          ),
        ],
      ),
    );
  }
}
