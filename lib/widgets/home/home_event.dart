import 'package:flutter/material.dart';
import 'package:my_horse/widgets/home/home_event_card.dart';

class HomeEvent extends StatelessWidget {

  const HomeEvent({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Nos derniers évènements", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                HomeEventCard(),
                HomeEventCard(),
                HomeEventCard(),
                HomeEventCard(),
                HomeEventCard(),
              ],
            ),
          )
        ],
      ),
    );
  }

}
