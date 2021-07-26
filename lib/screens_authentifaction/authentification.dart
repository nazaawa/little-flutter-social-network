import 'package:flutter/material.dart';
import 'package:watersocial/common/loading.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({Key? key}) : super(key: key);

  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showSignIn = true;

  @override
  void dispose() {
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
              title: Text(showSignIn
                  ? 'SIgn In To Water Social'
                  : 'Register to Water Social',style: TextStyle(
                    color :Colors.blue
                  ),),
              actions: [
                TextButton.icon(
                  onPressed: () => toggleView(),
                  label: Text(showSignIn ? 'register' : 'show sign in'),
                  icon: Icon(Icons.person),
                )
              ],
            ),
          );
  }
}
