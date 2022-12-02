import 'package:flutter/material.dart';
import 'package:my_horse/db/mongo_database.dart';
import 'package:my_horse/views/event_page.dart';
import 'package:my_horse/views/launch.dart';
import 'package:my_horse/views/login.dart';
import 'package:my_horse/views/profile.dart';
import 'package:my_horse/views/register.dart';
import 'package:my_horse/views/home.dart';
import 'package:my_horse/widgets/custom_bottom_navigation_bar.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: LaunchPage.tag,
      //initialRoute: HomePage.tag,

      routes: {
        LaunchPage.tag: (context) => const LaunchPage(title: "Bienvenue dans my horse"),
        HomePage.tag: (context) =>  const CustomBottomNavigationBar(),
        LoginPage.tag: (context) => const LoginPage(),
        RegisterPage.tag: (context) => const RegisterPage(),
      },
    );
  }

}

