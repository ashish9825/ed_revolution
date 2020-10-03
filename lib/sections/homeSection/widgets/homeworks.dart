import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:ed_revolution/sections/homeSection/constants.dart';
import 'package:ed_revolution/sections/homeSection/model/homework.dart';
import 'package:ed_revolution/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeworkSlider extends StatefulWidget {
  @override
  _HomeworkSliderState createState() => _HomeworkSliderState();
}

class _HomeworkSliderState extends State<HomeworkSlider> {
  List<HomeWork> homeworks = List<HomeWork>();

  @override
  void initState() {
    addHomeworks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeVertical * 2,
              vertical: SizeConfig.blockSizeHorizontal * 2),
          child: Text(
            'Homework',
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: SizeConfig.blockSizeHorizontal * 4),
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical,
        ),
        CarouselSlider(
          items: List.generate(
              homeworks.length, (index) => singleHomeWork(homeworks[index])),
          options: CarouselOptions(
            height: SizeConfig.blockSizeVertical*25,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: true,
            reverse: true,
            enableInfiniteScroll: true,
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 1.5,
        ),
      ],
    );
  }

  Widget singleHomeWork(HomeWork homeWork) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 4,
          vertical: SizeConfig.blockSizeVertical * 2.5),
      decoration: BoxDecoration(
          color: Color(0xFF62bcea),
          borderRadius:
              BorderRadius.circular(SizeConfig.blockSizeHorizontal * 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 5,
                vertical: SizeConfig.blockSizeVertical * 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFd2ecf9),
            ),
            child: SvgPicture.asset(
              homeWork.image,
              height: SizeConfig.blockSizeVertical * 3,
            ),
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homeWork.question,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal * 4),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                ),
                Text(
                  homeWork.subject,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal * 3),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 0.2,
                ),
                Flexible(
                  child: Row(
                    children: [
                      Text(
                        'Chapter ${homeWork.chapter.toString()}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 3),
                      ),
                      Text(
                        ' - ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 3),
                      ),
                      Text(
                        'Exercise ${homeWork.exercise.toString()}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 3),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 1.5,
                ),
                Flexible(
                  child: Row(
                    children: [
                      Text(
                        'Due in - ',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 3,
                            color: Colors.white),
                      ),
                      Text(
                        '${homeWork.dueDays.toString()} days',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                            color: Color(0xFFb30000)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void addHomeworks() {
    for (int i = 0; i < 3; i++) {
      homeworks.add(
        HomeWork(
            homeworkSubjectImage[i],
            homeworkQuestions[i],
            homeworkSubjects[i],
            homeworkChapters[i],
            homeworkExercises[i],
            homeworkDueDays[i]),
      );
    }
  }
}
