import 'package:ed_revolution/sections/homeSection/constants.dart';
import 'package:ed_revolution/sections/homeSection/model/subject.dart';
import 'package:ed_revolution/sections/subjectsSection/ui/subjects_screen.dart';
import 'package:flutter/material.dart';
import 'package:ed_revolution/utils/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySubjects extends StatefulWidget {
  @override
  _MySubjectsState createState() => _MySubjectsState();
}

class _MySubjectsState extends State<MySubjects> {
  List<Subject> subjects = List<Subject>();

  @override
  void initState() {
    addSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeVertical * 2,
          vertical: SizeConfig.blockSizeHorizontal * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Subjects',
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: SizeConfig.blockSizeHorizontal * 4),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: List.generate(
                subjects.length,
                (index) => subjectItem(subjects[index], index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget subjectItem(Subject subject, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubjectsScreen(index),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 5,
                  vertical: SizeConfig.blockSizeVertical * 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFd2ecf9),
              ),
              child: SvgPicture.asset(
                subject.subjectImage,
                height: SizeConfig.blockSizeHorizontal * 15,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            // fit: FlexFit.loose,
            child: Text(
              subject.subjectName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            ),
          ),
        ],
      ),
    );
  }

  void addSubjects() {
    for (int i = 0; i < 6; i++) {
      subjects.add(Subject(subjectImages[i], subjectNames[i]));
    }
  }
}
