import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.0)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 1.0)
        
        ),
    contentPadding: EdgeInsets.all(12.0),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 1.0)));
