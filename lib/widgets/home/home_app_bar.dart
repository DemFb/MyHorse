import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{

  const HomeAppBar({Key? key}): super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      leading: const Icon(Icons.notifications, color: Colors.black,),
      title: const Text("Club de cheval.", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Color(0xFFDA5C44)),),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
            child: const Icon(Icons.search, color: Colors.black,),
          ),
        )
      ],
    );
  }

}
