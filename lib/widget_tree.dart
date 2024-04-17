import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innolympics_sanetech/screens/emergency_hotlines_page.dart';
import 'package:innolympics_sanetech/screens/home_page.dart';
import 'package:innolympics_sanetech/screens/newsfeed_page.dart';
import 'package:innolympics_sanetech/screens/profile_page.dart';
import 'package:innolympics_sanetech/screens/submit_reports_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

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
            icon: Icon(CupertinoIcons.map),
            activeIcon: Icon(CupertinoIcons.map_fill),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            activeIcon: Icon(CupertinoIcons.news_solid),
            label: 'Newsfeed',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            activeIcon: Icon(CupertinoIcons.calendar_today),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            activeIcon: Icon(CupertinoIcons.phone_solid),
            label: 'Hotlines',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle),
            activeIcon: Icon(CupertinoIcons.person_circle_fill),
            label: 'Profile',
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
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  _buildUI() {
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
