import 'package:flutter/material.dart';
import 'package:my_horse/views/register.dart';
import 'login.dart';

class LaunchPage extends StatefulWidget {
  final String title;
   static const tag = "/";

  const LaunchPage({Key? key, required this.title}): super(key: key);

  @override
  LaunchPageState createState() => LaunchPageState();
}

class LaunchPageState extends State<LaunchPage> {

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    //final ButtonStyle style =
    //ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/pages/launch/adrobski-pGuAgo_o2r8-unsplash.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken
          )
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: size.width,
                height: 200,
                padding: const EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(15))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bienvenue dans le meilleur club.", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("We are fully approved by the Horse Society as professionnal riding school", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.4), fontWeight: FontWeight.w500)),
                    ),
                    Align(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterPage.tag);
                            },
                            child: const Text('Inscription'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, LoginPage.tag);
                            },
                            child: const Text('Connexion'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
