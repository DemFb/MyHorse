import 'package:flutter/material.dart';
import 'package:my_horse/activities/course/service/course_service.dart';
import 'package:my_horse/widgets/home/home_app_bar.dart';
import 'package:my_horse/widgets/home/home_event.dart';
import 'package:my_horse/widgets/home/riding_courses.dart';

class HomePage extends StatefulWidget {

  final Function callback;
  static const tag = "/home";

  const HomePage(void Function() this.callback, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CourseService().getAllCourses();
  }

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