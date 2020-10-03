import 'package:ed_revolution/bottom_navbar.dart/size_config.dart';
import 'package:ed_revolution/sections/subjectsSection/constants.dart';
import 'package:ed_revolution/sections/subjectsSection/widgets/sabt.dart';
import 'package:ed_revolution/sections/subjectsSection/widgets/subject_exercises.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SubjectsScreen extends StatefulWidget {
  final int initialIndex;

  SubjectsScreen(this.initialIndex);

  @override
  _SubjectsScreenState createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
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
        body: _subjectsBody(),
      ),
    );
  }

  Widget _subjectsBody() {
    var flexibleSpaceWidget = SliverAppBar(
      title: SABT(
        child: _sabtWidget(),
      ),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      expandedHeight: SizeConfig.blockSizeVertical * 43,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: _headerWidget(),
      ),
      bottom: TabBar(
        tabs: List.generate(
          subjectNames.length,
          (index) => Tab(
            child: Align(
              alignment: Alignment.center,
              child: Text(subjectNames[index]),
            ),
          ),
        ),
        indicatorColor: Color(0xFFFF7F98),
        labelColor: Colors.black87,
        unselectedLabelColor: Colors.black26,
        isScrollable: true,
      ),
    );

    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: subjectNames.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(top: false, sliver: flexibleSpaceWidget),
            )
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
          child: TabBarView(
            children: List.generate(
              subjectNames.length,
              (index) => SubjectExercises(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal * 8,
            top: SizeConfig.blockSizeVertical * 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subjects',
                    style:
                        TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 6),
                  ),
                  Container(
                    color: Color(0xFFFF7F98),
                    height: SizeConfig.blockSizeHorizontal,
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Text('Chapters taught this week'),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _subjectTaught("images/human_health.png", 'Human Health', "5"),
            _subjectTaught("images/nuclear_physics.png", 'Nuclaer Physics', "5")
          ],
        ),
      ],
    );
  }

  Widget _sabtWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              'Subjects',
            ),
            Container(
              color: Color(0xFFFF7F98),
              height: SizeConfig.blockSizeHorizontal,
              width: SizeConfig.blockSizeHorizontal * 5,
            ),
          ],
        ),
      ],
    );
  }

  Widget _subjectTaught(String image, String subject, String exercises) {
    return Container(
      width: SizeConfig.screenWidth * 0.4,
      decoration: BoxDecoration(
        color: Color(0xFFF8B3B7),
        borderRadius: BorderRadius.circular(SizeConfig.blockSizeHorizontal * 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
              height: SizeConfig.blockSizeVertical * 15,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2),
            child: Text(
              subject,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2),
            child: Text(
              '$exercises Exercises',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 2.7),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical,
          ),
        ],
      ),
    );
  }
}
