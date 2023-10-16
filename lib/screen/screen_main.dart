import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:namoo/widget/widget_button_toggle.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  bool _workingState = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.deepOrange,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.deepOrange),
              ),
              width: width * 0.95,
              height: height * 0.35,
              child: Swiper(
                physics: NeverScrollableScrollPhysics(),
                loop: false,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return _buildStartCard(width, height);
                }
              ),
            ),
          ),
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
        )
    );

  }
  Widget _buildStartCard(double width, double height) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, width * 0.024, 0, width * 0.06),
            child: Text(
              "15 Oct 2023",
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, width * 0.06, 0, 0),
              child: Text(
                "3:31 pm",
                style: TextStyle(
                  fontSize: width * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, width * 0.03, 0, width * 0.024),
            child: Text(
              "~9:30 pm",
              style: TextStyle(
                color: Colors.grey,
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, width * 0.024),
            // child: ButtonToggle(
            //     text: "Start",
            //     width: width,
            //     state: false,
            //     tap: () {
            //       setState(() {
            //       });
            //     }
            // ),
            child: _buildButtonToggle(width),
          ),
        ],
      ),
    );
  }
  Widget _buildButtonToggle(double width) {
    ButtonToggle _children = ButtonToggle(
        text: "Start",
        width: width,
        workingState: _workingState,
        tap: () {
          setState(() {
            _workingState = !_workingState;
          });
        },
    );
    return _children;
  }
}

