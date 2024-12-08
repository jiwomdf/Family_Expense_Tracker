import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:family_expense_tracker/util/app_color_util.dart';
import 'package:family_expense_tracker/util/ext/color_util.dart';
import 'package:family_expense_tracker/util/ext/int_util.dart';
import 'package:family_expense_tracker/util/ext/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CardExpenseWidget extends StatefulWidget {
  const CardExpenseWidget({super.key});

  @override
  State<CardExpenseWidget> createState() => _CardExpenseWidgetState();
}

class _CardExpenseWidgetState extends State<CardExpenseWidget> {
  int _totalExpense = 0;
  int _totalData = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(builder: (context, state) {
      _totalExpense = 0;
      _totalData = 0;
      if (state is ExpenseInitiated) {
        return const Row();
      } else if (state is ExpenseLoading) {
        return showExpenseShimmer();
      } else if (state is ExpenseHasData) {
        _totalData = state.result.length;
        for (var action in state.result) {
          _totalExpense += action.price;
        }
      }

      return Container(
        width: 160,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.redAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(S.of(context).expense,
                  style: TextUtil(context).urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white.primary,
                  )),
              Text("- Rp. ${_totalExpense.toRupiah()}",
                  style: TextUtil(context).urbanist(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white.primary,
                  )),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: S.of(context).totalData,
                      style: TextUtil(context).fontStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white.primary,
                      )),
                  TextSpan(
                      text: _totalData.toString(),
                      style: TextUtil(context).fontStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white.primary,
                      )),
                  TextSpan(
                      text: S.of(context).data,
                      style: TextUtil(context).fontStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white.primary,
                      )),
                ]),
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
