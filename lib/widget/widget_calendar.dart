
import 'package:flutter/material.dart';
import 'package:namoo/model/model_event.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarState();

}

class _CalendarState extends State<Calendar>{
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, dynamic> kEvents = {
    DateTime.utc(2023,10,1) : [Event('5분 기도하기', false),],
    DateTime.utc(2023,10,3) : [Event('5분 기도하기', false),Event('교회 가서 인증샷 찍기', false),Event('QT하기', true),Event('셀 모임하기', true),],
    DateTime.utc(2023,10,5) : [Event('5분 기도하기', true),Event('치킨 먹기', true),Event('QT하기', true),Event('셀 모임하기', true),],
    DateTime.utc(2023,10,8) : [Event('5분 기도하기', true),Event('자기 셀카 올리기', true),Event('QT하기', true),Event('셀 모임하기', true),],
    DateTime.utc(2023,10,11) : [Event('5분 기도하기', true),Event('가족과 저녁식사 하기', true),Event('QT하기', true)],
    DateTime.utc(2023,10,13) : [Event('5분 기도하기', true),Event('교회 가서 인증샷 찍기', true),Event('QT하기', true),Event('셀 모임하기', true),],
    DateTime.utc(2023,10,15) : [Event('5분 기도하기', true),Event('치킨 먹기', true),Event('QT하기', true),Event('셀 모임하기', true),],
    DateTime.utc(2023,10,18) : [Event('5분 기도하기', true),Event('자기 셀카 올리기', true),Event('QT하기', true),Event('셀 모임하기', true),],
    DateTime.utc(2023,10,20) : [Event('5분 기도하기', true),Event('자기 셀카 올리기', true),Event('QT하기', true),Event('셀 모임하기', true),],
    DateTime.utc(2023,10,25) : [Event('5분 기도하기', true),Event('가족과 저녁식사 하기', true),Event('QT하기', true)]
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
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
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
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
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
                height: 160,
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
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}',),
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