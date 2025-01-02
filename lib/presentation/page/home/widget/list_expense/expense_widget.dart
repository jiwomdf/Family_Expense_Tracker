import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_expense_tracker/generated/l10n.dart';
import 'package:group_expense_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:group_expense_tracker/presentation/page/home/widget/list_expense/list_expense_widget.dart';
import 'package:group_expense_tracker/util/ext/color_util.dart';
import 'package:group_expense_tracker/util/ext/text_util.dart';
import 'package:group_expense_tracker/util/style/app_assets_util.dart';
import 'package:group_expense_tracker/util/style/app_color_util.dart';
import 'package:group_expense_tracker/util/style/app_snackbar_util.dart';
import 'package:shimmer/shimmer.dart';

class ExpenseWidget extends StatefulWidget {
  const ExpenseWidget({super.key});

  @override
  State<ExpenseWidget> createState() => _ExpenseWidgetState();
}

class _ExpenseWidgetState extends State<ExpenseWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ExpenseBloc, ExpenseState>(
          builder: (context, state) {
            if (state is ExpenseInitiated) {
              return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssetsUtil.imgReloadPage, height: 200),
                    const SizedBox(height: 20),
                    Text(
                      S
                          .of(context)
                          .forSavingTheFirestoreUsageWereNotShowingAnyData,
                      style: TextUtil(context).urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: OutlinedButton(
                          onPressed: () {
                            var now = DateTime.now();
                            context
                                .read<ExpenseBloc>()
                                .add(GetExpenseEvent(now.month, now.year, ""));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Icons.refresh_sharp),
                              ),
                              Text("Reload",
                                  style: TextUtil(context).urbanist(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
                          )),
                    )
                  ],
                ),
              );
            } else if (state is ExpenseLoading) {
              return showExpenseListShimmer();
            } else if (state is ExpenseHasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListExpenseWidget(expenseCategoryModel: state.result),
              );
            } else if (state is ExpenseEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(S.of(context).noRecordYetPleaseCreateOne),
              );
            } else if (state is ExpenseDataChanged) {
              context.show(
                  S.of(context).dataUpdatedDataNotShowedYetInorderToSaveThe);
              context.read<ExpenseBloc>().add(const ResetExpenseEvent());
              return const Row();
            } else if (state is ExpenseError) {
              return Text(state.message);
            } else {
              return Text(S.of(context).somethingWentWrong);
            }
          },
        ),
      ],
    );
  }

  Widget showExpenseListShimmer() {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).cardColor,
      highlightColor: darken(Theme.of(context).cardColor, .05),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    height: 40,
                    width: 100),
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    height: 40,
                    width: 100),
              ],
            ),
          ),
          shimmerView(),
          shimmerView(),
          shimmerView(),
          shimmerView(),
          shimmerView(),
        ],
      ),
    );
  }

  Padding shimmerView() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.black.primary,
          ),
          height: 50,
          width: double.infinity),
    );
  }
}
