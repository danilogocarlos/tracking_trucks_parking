import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/app/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TTP",
      home: HomePage(),
    );
  }
}
