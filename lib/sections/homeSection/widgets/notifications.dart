import 'package:ed_revolution/sections/homeSection/constants.dart';
import 'package:ed_revolution/sections/homeSection/model/notification_edr.dart';
import 'package:ed_revolution/utils/size_config.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<NotificationEDR> notifications = List<NotificationEDR>();

  @override
  void initState() {
    addNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeVertical * 2,
          vertical: SizeConfig.blockSizeHorizontal * 2),
      child: Container(
        // height: SizeConfig.blockSizeVertical * 20,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2F80ED),
              Color(0xFF56CCF2),
            ],
          ),
          borderRadius:
              BorderRadius.circular(SizeConfig.blockSizeHorizontal * 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notifications',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.blockSizeHorizontal * 5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  notifications.length,
                  (index) => notificationItem(
                    notifications[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationItem(NotificationEDR notificationEDR) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notificationEDR.date,
          style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 3,
              color: Colors.white),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical*0.2,
        ),
        Text(
          notificationEDR.content,
          style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 2,
              color: Colors.white),
        ),
         SizedBox(
          height: SizeConfig.blockSizeVertical,
        ),
      ],
    );
  }

  void addNotifications() {
    for (int i = 0; i < 3; i++) {
      notifications.add(NotificationEDR(dates[i], contents[i]));
    }
  }
}
