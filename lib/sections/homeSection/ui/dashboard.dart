import 'package:ed_revolution/sections/chatSection/ui/chat_screen.dart';
import 'package:ed_revolution/sections/homeSection/ui/home.dart';
import 'package:ed_revolution/utils/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentTabIndex = 0;
  List<Widget> _children;

  void _onItemTapped(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _children = [
      HomeScreen(),
      ChatScreen(),
      Container(color: Colors.cyanAccent),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: _children[_currentTabIndex],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
            selectedIndex: _currentTabIndex,
            showElevation: false,
            items: [
              BottomNavBarItem(
                icon: 'images/home.svg',
                title: Text('Home'),
                activeColor: Color(0xFF1F5F8B),
                inactiveColor: Color(0xFFb7b7c8),
              ),
              BottomNavBarItem(
                icon: 'images/chat.svg',
                title: Text('Chat'),
                activeColor: Color(0xFF1F5F8B),
                inactiveColor: Color(0xFFb7b7c8),
              ),
              BottomNavBarItem(
                icon: 'images/user.svg',
                title: Text('Profile'),
                activeColor: Color(0xFF1F5F8B),
                inactiveColor: Color(0xFFb7b7c8),
              ),
            ],
            onItemSelected: _onItemTapped),
      ),
    );
  }
}
