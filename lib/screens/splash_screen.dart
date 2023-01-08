import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pusher_check_flutter/screens/home_screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, CupertinoPageRoute(builder: (_)=>HomeScreen()));
    });
    return const Scaffold(
      body: Center(
        child: CircleAvatar(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        ),
      )
    );
  }
}
