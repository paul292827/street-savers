import 'package:flutter/material.dart';
//import 'package:street_savers/src';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
          ),
          child: Text('Login'),
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Login()));
          } ,
          ),
      ),
    );
  }
}