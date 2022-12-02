import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/event_page.dart';
import '../views/home.dart';
import '../views/profile.dart';

class CustomBottomNavigationBar extends StatefulWidget {

  const CustomBottomNavigationBar({Key? key}): super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int activeIndex = 0;
  void changeActivePage(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      HomePage(() => changeActivePage(2)),
      const EventPage(),
      const Profile(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F5E4),
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () => changeActivePage(0), icon: const Icon(Icons.home)),
                IconButton(onPressed: () => changeActivePage(1), icon: const Icon(Icons.calendar_today_sharp)),
                IconButton(onPressed: () => changeActivePage(2), icon: const Icon(Icons.person)),
              ],
            ),
          ),
        ),
        body: pages[activeIndex]);
  }
}