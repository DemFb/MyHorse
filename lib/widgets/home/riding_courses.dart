import 'package:flutter/material.dart';

class RidingCourses extends StatelessWidget {

  const RidingCourses({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Cours D'équitation", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),),
          Container(
            height: 120,
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(25)),
                        border: Border.all(width: 3, color: const Color(0xFFDA5C44)),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/pages/launch/adrobski-pGuAgo_o2r8-unsplash.jpg"),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                    const Text("Endurance", style: TextStyle(fontWeight: FontWeight.w500),)
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

}
