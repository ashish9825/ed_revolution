import 'package:ed_revolution/bottom_navbar.dart/size_config.dart';
import 'package:ed_revolution/sections/chatSection/widgets/student_chats.dart';
import 'package:ed_revolution/sections/chatSection/widgets/teacher_chats..dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: _headerWidget(),
          automaticallyImplyLeading: false,
          toolbarHeight: SizeConfig.blockSizeVertical * 18,
          elevation: 0.0,
          backgroundColor: Colors.white,
          bottom: _tabBar(),
        ),
        body: _tabBody(),
      ),
    );
  }

  Widget _headerWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 6,
        top: SizeConfig.blockSizeVertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chats',
                style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 6),
              ),
              Container(
                color: Color(0xFFFF7F98),
                height: SizeConfig.blockSizeHorizontal,
                width: SizeConfig.blockSizeHorizontal * 5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _tabBar() {
    return TabBar(
      tabs: [
        Tab(
          child: Container(
            width: SizeConfig.blockSizeHorizontal * 20,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal * 10)),
            child: Align(
              alignment: Alignment.center,
              child: Text('Teacher'),
            ),
          ),
        ),
        Tab(
          child: Container(
            width: SizeConfig.blockSizeHorizontal * 20,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal * 10)),
            child: Align(
              alignment: Alignment.center,
              child: Text('Mate'),
            ),
          ),
        ),
      ],
      controller: _tabController,
      indicator: BoxDecoration(
        color: Color(0xFFd2ecf9),
        borderRadius:
            BorderRadius.circular(SizeConfig.blockSizeHorizontal * 10),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.black87,
      unselectedLabelColor: Colors.black26,
    );
  }

  Widget _tabBody() {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: TabBarView(
        controller: _tabController,
        children: [TeacherChats(), StudentChats()],
      ),
    );
  }
}
