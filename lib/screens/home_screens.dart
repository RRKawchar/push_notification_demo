import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     print("Hellollloo");
    // foreground message
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
     if(message.notification !=null){
       print(message.notification!.title);
       print(message.notification!.body);
     }
    });
  /// app is open but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
        if(message.notification !=null){
          print(message.notification!.title);
          print(message.notification!.body);
          print(message.data['path']);
          Navigator.of(context).pushNamed('recommended');
        }
    });

    FirebaseMessaging.instance.getInitialMessage().then((message){
      if(message !=null){
        print(message.notification!.title);
        print(message.notification!.body);
        print(message.data['path']);
      }
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
