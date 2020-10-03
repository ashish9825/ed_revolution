import 'package:ed_revolution/bottom_navbar.dart/size_config.dart';
import 'package:ed_revolution/sections/chatSection/constants.dart';
import 'package:ed_revolution/sections/chatSection/model/teacher_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeacherChats extends StatefulWidget {
  @override
  _TeacherChatsState createState() => _TeacherChatsState();
}

class _TeacherChatsState extends State<TeacherChats> {
  List<TeacherChat> teacherChats = List<TeacherChat>();

  @override
  void initState() {
    addTeacherChats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: List.generate(
                teacherChats.length,
                (index) => singleTeacher(
                  teacherChats[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget singleTeacher(TeacherChat teacherChat) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal * 3,
        SizeConfig.blockSizeHorizontal * 4,
        SizeConfig.blockSizeHorizontal * 3,
        SizeConfig.blockSizeHorizontal * 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Visibility(
              //   visible: false,
              //   maintainState: true,
              //   maintainAnimation: true,
              //   maintainSize: true,
              //   child: Icon(
              //     FontAwesome.circle,
              //     size: 8.0,
              //     color: Color(0xFF339966),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 5,
                    right: SizeConfig.blockSizeHorizontal * 5),
                child: SvgPicture.asset(
                  teacherChat.image,
                  width: SizeConfig.blockSizeHorizontal * 10,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    teacherChat.name,
                    style: TextStyle(fontFamily: 'Poppins-Medium'),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeHorizontal,
                  ),
                  Text(
                    teacherChat.message,
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: SizeConfig.blockSizeHorizontal * 2.6,
                        color: Colors.black54),
                  )
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 3),
              child: Text(
                teacherChat.subject,
                style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: SizeConfig.blockSizeHorizontal * 2.4,
                    color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addTeacherChats() {
    for (int i = 0; i < 4; i++) {
      teacherChats.add(
        TeacherChat(
          chatTeacherImages[i],
          chatTeacherNames[i],
          chatTeacherSubjs[i],
          dummyMessages[i],
        ),
      );
    }
  }
}
