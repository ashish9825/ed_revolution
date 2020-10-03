import 'package:ed_revolution/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: SizeConfig.blockSizeHorizontal * 5),
        Row(
          children: <Widget>[
            SizedBox(width: SizeConfig.blockSizeHorizontal * 5),
            Container(
              width: SizeConfig.blockSizeHorizontal * 15,
              height: SizeConfig.blockSizeHorizontal * 15,
              child: Image.asset(
                'images/user_logo.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 15.0,
                    color: Color(0xFF210a43),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Class 8, St. Xavier\'s High School',
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 11.0,
                          color: Color(0xFF1891ac)),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal * 6),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 5,
              right: SizeConfig.blockSizeHorizontal * 5),
          child: Divider(
            color: Color(0xFFb3b3b3),
          ),
        ),
      ],
    );
  }
}
