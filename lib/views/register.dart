import 'package:flutter/material.dart';
import 'package:my_horse/authentication/auth_service.dart';
import 'package:my_horse/authentication/model/user_model.dart';
import 'package:my_horse/views/login.dart';

class RegisterPage extends StatefulWidget {
  static const tag = "/register";
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final AuthService _authService = AuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  _submitForm({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      _authService.register(map: UserModel(
        username: _usernameController.text, password: _passwordController.text,
        email: _emailController.text, photoUrl: "fakePhotoUrl", roles: ["user"]).toMap()
      ).then((value) {
        Navigator.pushNamed(context, LoginPage.tag);
      });
    }
  }

  String? _formVieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Veuillez remplir le champ suivant";
    }
    return null;
  }

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: _formVieldValidator,
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Nom d'utilisateur",
                          hintText: "Entrerz votre nom d'utilisateur"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: _formVieldValidator,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mot de passe',
                          hintText: 'Entrez votre mot de passe'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 15.0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adresse mail',
                          hintText: 'Entrez votre adresse mail'
                      ),
                      validator: _formVieldValidator,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        _submitForm(formKey: _formKey);
                      },
                      child: const Text(
                        "S'inscrire",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //),
                  ),
                ],
              ),
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
