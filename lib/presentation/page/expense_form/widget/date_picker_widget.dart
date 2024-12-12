import 'package:flutter/material.dart';
import 'package:group_expense_tracker/util/ext/date_format_util.dart';
import 'package:group_expense_tracker/util/ext/text_util.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final ValueChanged<DateTime> callback;
  final DateTime? initialDate;
  final String? _restorationId;

  const DatePickerWidget({
    super.key,
    String? restorationId,
    this.initialDate,
    required this.callback,
  }) : _restorationId = restorationId;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget>
    with RestorationMixin {
  @override
  String? get restorationId => widget._restorationId;

  RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @override
  void initState() {
    super.initState();
    _selectedDate = RestorableDateTime(widget.initialDate ?? DateTime.now());
  }

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2016),
          lastDate: DateTime.now(),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        widget.callback(_selectedDate.value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: Builder(builder: (context) {
            String formattedDate = DateFormat(DateFormatUtil.ddMMMMyyyy)
                .format(widget.initialDate ?? DateTime.now());
            return Text(formattedDate,
                style: TextUtil(context).plusJakarta(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ));
          }),
        ),
      ],
    );
  }
}
