import 'package:flutter/material.dart';
import 'package:watersocial/common/constant.dart';
import 'package:watersocial/common/loading.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({Key? key}) : super(key: key);

  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String password = '';
  String email = "";
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showSignIn = true;

  @override
  void dispose() {
    _formKey.currentState!.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
      emailController.text = "";
      passwordController.text = "";
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                showSignIn
                    ? 'SIgn In To Water Social'
                    : 'Register to Water Social',
                style: TextStyle(color: Colors.blue),
              ),
              actions: [
                TextButton.icon(
                  onPressed: () => toggleView(),
                  label: Text(showSignIn ? 'register' : 'show sign in'),
                  icon: Icon(Icons.person),
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    controller: emailController,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'email'
                      ),
                    validator: (value) =>
                        value!.isEmpty ? 'ENtrer un email' : null,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: passwordController,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'password'),
                      validator: (value) => value!.length < 6
                          ? 'le mot de passe doit au moins contenir 6 character'
                          : null),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });

                          password = passwordController.value.text;

                          email = emailController.value.text;
                        }
                        dynamic result = null;
                        if (result == null) {
                          setState(() {
                            // loading = false ;
                            error = 'please enter  ';
                          });
                        }
                      },
                      child: Text(showSignIn ? 'Sign in' : 'Register'))
                ]),
              ),
            ));
  }
}
