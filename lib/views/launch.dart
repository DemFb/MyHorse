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
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () => Navigator.pushNamed(context, LoginPage.tag),
              child: const Text('Connexion'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () => Navigator.pushNamed(context, RegisterPage.tag),
              child: const Text('inscription'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
