import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const tag = "/register";
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbe9e7),
      appBar: AppBar(
        title: const Text("Inscription"),
        backgroundColor: const Color(0xffff8a65),
      ),
      body: Container(
    decoration: const BoxDecoration(
    ),
      child: SingleChildScrollView(
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
            const Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 15.0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adresse mail',
                    hintText: 'Entrez votre adresse mail'),
              ),
            ),
            Container(
              height: 50,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffff8a65).withOpacity(0.8), borderRadius: BorderRadius.circular(15)),
              //child: TextButton(
              //onPressed: () {
              // Navigator.push(
              //    context, MaterialPageRoute(builder: (_) => HomePage()));
              // },
              child: const Text(
                "Choisir une photo de profil",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              //),
            ),
            Container(
              padding: const EdgeInsets.all(10),
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
                "S'inscrire",
                style: TextStyle(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              //),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text('Déjà inscrit? Connectez-vous')
          ],
        ),
      ),
    )
    );
  }
}
