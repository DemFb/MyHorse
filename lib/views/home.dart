import 'package:flutter/material.dart';
import 'package:my_horse/widgets/home/home_app_bar.dart';
import 'package:my_horse/widgets/home/home_event.dart';
import 'package:my_horse/widgets/home/riding_courses.dart';

class HomePage extends StatefulWidget {

  static const tag = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F5E4),
        appBar: const HomeAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const RidingCourses(),
                const HomeEvent()
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return false;
        } else {
          return true;
        }
      }
    );
  }
}