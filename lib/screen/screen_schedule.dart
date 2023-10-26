import 'package:flutter/material.dart';
import 'package:namoo/widget/widget_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Schedule"),
          backgroundColor: Colors.deepOrange,
          bottom: TabBar(
            // isScrollable: true,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(100), // Creates border
                color: Colors.deepPurple),
            tabs: [
              Tab( child: Column( children: [
                Text("Mon", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
                Text("13", style: TextStyle(fontSize: width * 0.055), textAlign: TextAlign.center),
                //Text("Oct", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
              ],),),
              Tab( child: Column(children: [
                Text("Tue", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
                Text("14", style: TextStyle(fontSize: width * 0.055), textAlign: TextAlign.center),
                //Text("Oct", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
              ],),),
              Tab( child: Column(children: [
                Text("Wed", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
                Text("15", style: TextStyle(fontSize: width * 0.055), textAlign: TextAlign.center),
                //Text("Oct", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
              ],),),
              Tab( child: Column(children: [
                Text("Thu", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
                Text("16", style: TextStyle(fontSize: width * 0.055), textAlign: TextAlign.center),
                //Text("Oct", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
              ],),),
              Tab( child: Column(children: [
                Text("Fri", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
                Text("17", style: TextStyle(fontSize: width * 0.055), textAlign: TextAlign.center),
                //Text("Oct", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
              ],),),
              Tab( child: Column(children: [
                Text("Sat", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
                Text("18", style: TextStyle(fontSize: width * 0.055), textAlign: TextAlign.center),
                //Text("Oct", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
              ],),),
              Tab( child: Column(children: [
                Text("Sun", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
                Text("19", style: TextStyle(fontSize: width * 0.055), textAlign: TextAlign.center),
                //Text("Oct", style: TextStyle(fontSize: width * 0.03), textAlign: TextAlign.center),
              ],),),
            ],
          ),
          leading:  Container(),
        ),
        body : Column(
          children: [
            Calendar()
            // TableCalendar(
            //   firstDay: DateTime.utc(2010, 10, 16),
            //   lastDay: DateTime.utc(2030, 3, 14),
            //   focusedDay: _focusedDay,
            //   selectedDayPredicate: (day) {
            //     return isSameDay(_selectedDay, day);
            //   },
            //   onDaySelected: (selectedDay, focusedDay) {
            //     setState(() {
            //       _selectedDay = selectedDay;
            //       _focusedDay = focusedDay; // update `_focusedDay` here as well
            //     });
            //   },
            //   // calendarFormat: _calendarFormat,
            //   // onFormatChanged: (format) {
            //   //   setState(() {
            //   //     _calendarFormat = format;
            //   //   });
            //   // },
            //   onPageChanged: (focusedDay) {
            //     _focusedDay = focusedDay;
            //   },
            // ),
          ],
        )
      ),
    );
  }
}