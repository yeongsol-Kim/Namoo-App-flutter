import 'package:flutter/material.dart';
import 'package:namoo/screen/screen_main.dart';
import 'package:namoo/screen/screen_notice.dart';
import 'package:namoo/screen/screen_people.dart';
import 'package:namoo/screen/screen_schedule.dart';
import 'package:namoo/screen/screen_work_log.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    MainScreen(),
    NoticeScreen(),
    WorkLogScreen(),
    ScheduleScreen(),
    PeopleScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    
    return SafeArea(
      child: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_alert_outlined),
              label: 'Notice',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'WorkLog',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ad_units_outlined),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded),
              label: 'People',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}