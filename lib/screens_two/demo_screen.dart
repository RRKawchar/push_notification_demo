import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  final String id;
  const DemoScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(id),
      ),
    );
  }
}
