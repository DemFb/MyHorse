import 'package:flutter/material.dart';
import 'package:my_horse/db/mongo_database.dart';
import 'package:my_horse/views/launch.dart';
import 'package:my_horse/views/login.dart';
import 'package:my_horse/views/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: LaunchPage.tag,
      routes: {
        LaunchPage.tag: (context) => const LaunchPage(title: "Bienvenue dans my horse"),
        LoginPage.tag: (context) => const LoginPage(),
        RegisterPage.tag: (context) => const RegisterPage(),

      },
    );
  }
}
