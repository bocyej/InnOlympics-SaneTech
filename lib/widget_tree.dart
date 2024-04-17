import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innolympics_sanetech/screens/emergency_hotlines_page.dart';
import 'package:innolympics_sanetech/screens/home_page.dart';
import 'package:innolympics_sanetech/screens/newsfeed_page.dart';
import 'package:innolympics_sanetech/screens/profile_page.dart';
import 'package:innolympics_sanetech/screens/submit_reports_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int _currentPage = 0;

  List<Widget> bottomNavigationPage = [
    const HomePage(),
    const NewsfeedPage(),
    const SubmitReportsPage(),
    const EmergencyHotlinesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_alt),
            activeIcon: Icon(CupertinoIcons.house_alt),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.map),
            activeIcon: Icon(CupertinoIcons.map),
            label: 'Self-Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            activeIcon: Icon(CupertinoIcons.calendar),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.mail),
            activeIcon: Icon(CupertinoIcons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear),
            activeIcon: Icon(CupertinoIcons.gear),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 32,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: bottomNavigationPage[_currentPage],
      ),
    );
  }
}
