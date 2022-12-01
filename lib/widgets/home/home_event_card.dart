import 'package:flutter/material.dart';

class HomeEventCard extends StatelessWidget {

  const HomeEventCard({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .9,
      height: 210,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: const AssetImage("assets/images/pages/launch/adrobski-pGuAgo_o2r8-unsplash.jpg"),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.srcOver,
          ),
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Course", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),),
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(width: 1, color: Colors.white),
              color: Colors.white10.withOpacity(0.3)
            ),
            child: const Icon(Icons.arrow_right_alt_rounded, color: Colors.white,),
          )
        ],
      ),
    );
  }

}