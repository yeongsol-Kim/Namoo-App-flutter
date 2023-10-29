
import 'package:flutter/material.dart';
import 'package:namoo/model/model_event.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarState();

}

class _CalendarState extends State<Calendar>{
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateFormat shiftTimeFormat = DateFormat("HH:mm");
  Map<DateTime, dynamic> kEvents = {
    DateTime.utc(2023,10,29) : [Event('Jack', DateTime(2023, 10, 29, 11, 30), DateTime(2023, 10, 29, 22, 0),), Event('Hanz', DateTime(2023, 10, 29, 11, 30, 0), DateTime(2023, 10, 29, 22, 00, 0),)],
    DateTime.utc(2023,10,30) : [Event('sol', DateTime(2023, 10, 2, 9, 30), DateTime(2023, 10, 2, 16, 0),)],
  };

  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2033, 1, 1),
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.twoWeeks,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selectedDay = DateTime.utc(selectedDay.year, selectedDay.month, selectedDay.day, 0, 0, 0, 0);
              print(selectedDay);
              print(selectedDay);
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
              _selectedEvents.value = _getEventsForDay(selectedDay);
            });
          },
          // onFormatChanged: (format) {
          //   setState(() {
          //     _calendarFormat = format;
          //   });
          // },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          eventLoader: _getEventsForDay,
        ),
        const SizedBox(height: 8.0),
        // Expanded(
        Container(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return Container(
                height: 300,
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}',),
                        subtitle: Text('${shiftTimeFormat.format(value[index].startTime)} ~ ${shiftTimeFormat.format(value[index].endTime)}'),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        )
      ]
    );
  }
}