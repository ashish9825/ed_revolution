import 'package:ed_revolution/sections/homeSection/widgets/homeworks.dart';
import 'package:ed_revolution/sections/homeSection/widgets/last_stats.dart';
import 'package:ed_revolution/sections/homeSection/widgets/subjects.dart';
import 'package:ed_revolution/sections/homeSection/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                TopBar(),
              ],
            ),
            HomeworkSlider(),
            // Notifications(),
            LastStats(),
            MySubjects(),
          ],
        ),
      )
    );
  }
}
