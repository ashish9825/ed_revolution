import 'package:ed_revolution/sections/homeSection/constants.dart';
import 'package:ed_revolution/sections/homeSection/model/last_week_stat.dart';
import 'package:ed_revolution/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LastStats extends StatefulWidget {
  @override
  _LastStatsState createState() => _LastStatsState();
}

class _LastStatsState extends State<LastStats> {
  List<LastWeekStat> lastWeekStats = List<LastWeekStat>();

  @override
  void initState() {
    addLastWeekStats();
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
        children: [
          Text(
            'Last Week Stats',
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: SizeConfig.blockSizeHorizontal * 4),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical*2,
          ),
          Column(
            children: List.generate(
                lastWeekStats.length,
                (index) => (index % 2 == 0)
                    ? lastStatItemLeft(lastWeekStats[index])
                    : lastStatItemRight(lastWeekStats[index])),
          )
        ],
      ),
    );
  }

  Widget lastStatItemLeft(LastWeekStat lastWeekStat) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical,
              horizontal: SizeConfig.blockSizeHorizontal * 2),
          decoration: BoxDecoration(
            color: Color(0xFFd2ecf9),
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeHorizontal * 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    lastWeekStat.image,
                    height: SizeConfig.blockSizeVertical * 8,
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(lastWeekStat.subject),
                      Text(lastWeekStat.testName),
                      Text(
                          '${lastWeekStat.marksObtained} / ${lastWeekStat.totalMarks}')
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 5,
                    vertical: SizeConfig.blockSizeVertical),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Color(0xFF1F5F8B),
                    ),
                    borderRadius:
                        BorderRadius.circular(SizeConfig.blockSizeHorizontal)),
                child: Text('View'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical*1.5,
        ),
      ],
    );
  }

  Widget lastStatItemRight(LastWeekStat lastWeekStat) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical,
              horizontal: SizeConfig.blockSizeHorizontal * 2),
          decoration: BoxDecoration(
            color: Color(0xFFd2ecf9),
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeHorizontal * 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 5,
                    vertical: SizeConfig.blockSizeVertical),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Color(0xFF1F5F8B),
                    ),
                    borderRadius:
                        BorderRadius.circular(SizeConfig.blockSizeHorizontal)),
                child: Text('View'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(lastWeekStat.subject),
                      Text(lastWeekStat.testName),
                      Text(
                          '${lastWeekStat.marksObtained} / ${lastWeekStat.totalMarks}')
                    ],
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  SvgPicture.asset(
                    lastWeekStat.image,
                    height: SizeConfig.blockSizeVertical * 8,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical*1.5,
        ),
      ],
    );
  }

  void addLastWeekStats() {
    for (int i = 0; i < 4; i++) {
      lastWeekStats.add(
        LastWeekStat(statSubjectImages[i], statSubjectNames[i],
            statTestNames[i], statMarksObtained[i], statTotalMarks[i]),
      );
    }
  }
}
