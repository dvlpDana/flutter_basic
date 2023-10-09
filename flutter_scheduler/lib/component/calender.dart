import 'package:flutter/material.dart';
import 'package:flutter_scheduler/const/colors.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;

  const Calender(
      {required this.selectedDay,
      required this.focusedDay,
      required this.onDaySelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(6.0),
    );
    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );

    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime(1900),
      lastDay: DateTime(2300),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          defaultDecoration: defaultBoxDeco,
          weekendDecoration: defaultBoxDeco,
          selectedDecoration: defaultBoxDeco.copyWith(
            color: Colors.transparent,
            border: Border.all(color: PRIMARY_COLOR),
          ),
          outsideDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle.copyWith(
            color: Colors.red[300],
          ),
          selectedTextStyle: defaultTextStyle.copyWith(
            color: PRIMARY_COLOR,
          )),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date) {
        if (selectedDay == null) {
          return false;
        }

        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
    );
  }
}
