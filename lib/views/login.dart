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
    return Scaffold(
      backgroundColor: const Color(0xfffbe9e7),
      appBar: AppBar(
        title: const Text("Connexion"),
        backgroundColor: const Color(0xffff8a65),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/pages/launch/horse_logo.jpeg')),
              ),
            ),
            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nom d'utilisateur",
                    hintText: "Entrerz votre nom d'utilisateur"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mot de passe',
                    hintText: 'Entrez votre mot de passe'),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Mot de passe oublié',
                style: TextStyle(color: Color(0xffff8a65), fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffff8a65), borderRadius: BorderRadius.circular(20)),
              //child: TextButton(
                //onPressed: () {
                 // Navigator.push(
                  //    context, MaterialPageRoute(builder: (_) => HomePage()));
               // },
                child: const Text(
                  'Connexion',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              //),
            ),
            const SizedBox(
              height: 130,
            ),
            const Text('Nouvel utilisateur? Créer un compte')
          ],
        ),
      ),
    );
  }
}


