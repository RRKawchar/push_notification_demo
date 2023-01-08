import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pusher_check_flutter/notificationservice/local_notification_service.dart';

import 'package:pusher_check_flutter/screens_two/home_screen_two.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreenTwo(),


    );
  }
}
