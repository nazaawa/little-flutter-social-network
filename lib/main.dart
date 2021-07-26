import 'package:flutter/material.dart';


import 'screens_authentifaction/authentification.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthenticateScreen()
    );
  }
}