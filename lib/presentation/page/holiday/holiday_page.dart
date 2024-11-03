import 'package:core/data/network/response/holiday_response.dart';
import 'package:core/util/date_format_util.dart';
import 'package:family_expense_tracker/presentation/bloc/holidays/holiday_bloc.dart';
import 'package:family_expense_tracker/util/app_color_util.dart';
import 'package:family_expense_tracker/util/ext/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HolidayPage extends StatefulWidget {
  static const routeName = '/holiday-page';
  const HolidayPage({super.key});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  var isFirstUpComingEvent = false;

  @override
  void initState() {
    super.initState();
    context.read<HolidayBloc>().add(GetHolidayEvent(DateTime.now().year, "ID"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Holiday's Calendar"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(child:
          BlocBuilder<HolidayBloc, HolidayState>(builder: (context, state) {
        if (state is HolidayLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HolidayHasData) {
          return ListView.builder(
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                return listHoliday(state.result[index]);
              });
        } else if (state is HolidayError) {
          return Text(state.message);
        } else {
          return const SizedBox();
        }
      })),
    );
  }

  Widget listHoliday(HolidayResponse result) {
    var isUpComingEvent =
        ((result.date?.toDateGlobalFormat()?.compareTo(DateTime.now())) ?? 0) <
            0;
    return Builder(builder: (context) {
      if (isUpComingEvent && !isFirstUpComingEvent) {
        isFirstUpComingEvent = true;
      }
      Widget card = cardContainer(isUpComingEvent, context, result);
      isFirstUpComingEvent = false;
      return card;
    });
  }

  Container cardContainer(
    bool isUpComingEvent,
    BuildContext context,
    HolidayResponse result,
  ) {
    var isNearestHoliday = isUpComingEvent && isFirstUpComingEvent;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isNearestHoliday
            ? Theme.of(context).cardColor
            : AppColors.red.primary,
      ),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(result.localName ?? "",
                style: TextUtil(context).plusJakarta(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isNearestHoliday ? Colors.black : Colors.white,
                )),
          ]),
          Text(result.name ?? "",
              style: TextUtil(context).plusJakarta(
                fontSize: 12,
                color: isNearestHoliday ? Colors.black : Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              (result.date ?? "")
                      .toDateGlobalFormat()
                      ?.toDateString(DateFormatUtil.ddMMMyyyy) ??
                  "",
              style: TextUtil(context).plusJakarta(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isNearestHoliday ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
