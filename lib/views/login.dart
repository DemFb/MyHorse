import 'package:flutter/material.dart';
import 'package:my_horse/authentication/auth_service.dart';
import 'package:my_horse/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const tag = "/login";
  const LoginPage({Key? key}): super(key: key);

  @override
   LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _sharedPreferences =  SharedPreferences.getInstance();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _formSubmit({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      _authService.login(data: {"email": _emailController.text, "password": _passwordController.text})
        .then((value) async {
          SharedPreferences _prefs = await _sharedPreferences;
          String? token = _prefs.getString("token");
          if (token != null) {
            Navigator.pushNamed(context, HomePage.tag, arguments: token);
          }
      });
    }
  }

  String? _formFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Veuillez remplir ce champ";
    }
    return null;
  }

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _emailController,
                      validator: _formFieldValidator,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "Entrez votre email"
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      validator: _formFieldValidator,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mot de passe',
                        hintText: 'Entrez votre mot de passe'
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        _formSubmit(formKey: _formKey);
                      },
                      child: const Text(
                        'Connexion',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //),
                  ),
                ],
              ),
            ),
            const Text('Nouvel utilisateur? Créer un compte')
          ],
        ),
      ),
    );
  }
}


