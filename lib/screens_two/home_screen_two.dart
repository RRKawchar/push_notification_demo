import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pusher_check_flutter/notificationservice/local_notification_service.dart';
import 'package:pusher_check_flutter/screens_two/demo_screen.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({Key? key}) : super(key: key);

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  String deviceTokenToSendPushNotification='';
/*
{
    "registration_ids": [
        "fPh6bSxBS6yT5xSgbp9tOQ:APA91bFp07wZwo8zYPqJqe93hOqDLkT3kx5o4bgvywA1gvzmmSdUdLyTvWptrv6yTOi9cDXymuvs6ROX0JZO0dwsvW_YzfICX1ANAVrr7E5gh8W3fhSD2pKO5N0yATsdoQDd2SOPepRd"
    ],
    "notification": {
        "body": "New Video has been uploaded",
        "title": "Inventorcode",
        "android_channel_id": "push_notification_check",
        "sound": false
    }
}
*/
  @override
  void initState() {
    super.initState();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DemoScreen(
                  id: message.data['_id'],
                ),
              ),
            );
          }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);

        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
  }

  @override
  Widget build(BuildContext context) {
    getDeviceTokenToSendNotification();
    return const Scaffold(
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
