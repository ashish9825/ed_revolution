import 'package:ed_revolution/sections/subjectsSection/constants.dart';
import 'package:ed_revolution/sections/subjectsSection/model/chapter.dart';
import 'package:ed_revolution/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubjectExercises extends StatefulWidget {
  final int index;

  SubjectExercises(this.index);

  @override
  _SubjectExercisesState createState() => _SubjectExercisesState();
}

class _SubjectExercisesState extends State<SubjectExercises> {
  List<Chapter> chapters = List<Chapter>();

  @override
  void initState() {
    addChapters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return widget.index == 4
        ? SingleChildScrollView(
            child: Container(
              child: Column(
                children: List.generate(
                  chapters.length,
                  (index) => _singleChapter(
                    chapters[index],
                  ),
                ),
              ),
            ),
          )
        : Container();
  }

  Widget _singleChapter(Chapter chapter) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical,
          horizontal: SizeConfig.blockSizeHorizontal * 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF62bcea),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeHorizontal * 2.3,
                        horizontal: SizeConfig.blockSizeVertical * 2),
                    child: SvgPicture.asset(
                      chapter.image,
                      height: SizeConfig.blockSizeVertical * 2.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chapter.name),
                  Text(
                    '${chapter.exercises} Exercises',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  void addChapters() {
    for (int i = 0; i < 5; i++) {
      chapters.add(
        Chapter(mathImages[i], mathChapters[i], mathExercises[i]),
      );
    }
  }
}
