import 'package:flutter/material.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/events.dart';
import 'package:date_format/date_format.dart';

class Calendar extends StatefulWidget {
  static const String id = 'calendar_screen';
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  DateTime now = DateTime.now();

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  int option = 0;

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
    // return [Event(title: "hello")];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedEvents[DateTime.parse('2022-07-09 05:30:00')] = [
      Event(title: "In time: 8:30 am \nOut time 10:30 pm")
    ];
    selectedEvents[DateTime.parse('2022-07-10 05:30:00')] = [
      Event(title: "In time: 9:30 am \nOut time 9:30 pm",)
    ];
    selectedEvents[DateTime.parse('2022-07-11 05:30:00')] = [
      Event(title: "In time: 10:30 am \nOut time 8:30 pm"),
    ];
    selectedEvents[DateTime.parse('2022-07-12 05:30:00')] = [
      Event(title: "In time: 8:30 am \nOut time 10:30 pm")
    ];
    selectedEvents[DateTime.parse('2022-07-13 05:30:00')] = [
      Event(title: "In time: 9:30 am \nOut time 9:30 pm")
    ];
    selectedEvents[DateTime.parse('2022-07-14 05:30:00')] = [
      Event(title: "In time: 10:30 am \nOut time 8:30 pm")
    ];

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('Calendar', style: kHeadingText),
        centerTitle: true,
        backgroundColor: kAppbarTextColor,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(now.year, now.month - 12),
            lastDay: now,
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            calendarBuilders:
                CalendarBuilders(markerBuilder: ((context, day, events) {
              print("day is $day");
              return Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: day == DateTime.parse('2022-07-14 00:00:00.000Z')
                      ? Colors.green
                      : day == DateTime.parse('2022-07-15 00:00:00.000Z')
                          ? Colors.yellow
                          : Colors.red,
                  shape: BoxShape.circle,
                ),
              );
            })),
            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay.toLocal();
                focusedDay = focusDay.toLocal();
              });
              print("selected $selectedDay");
              print("focus $focusedDay");
              print("select $selectedEvents");
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => ListTile(
              title: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Text(event.title,style: kPrimaryText
                      //  "In time:  10:30 am\n\nOut time:  7:30 pm",style:kPrimaryText,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
