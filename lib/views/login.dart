import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const tag = "/login";
  const LoginPage({Key? key}): super(key: key);

  @override
   LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
