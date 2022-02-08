import 'package:flutter/material.dart';
import 'package:street_savers/src/loginPage.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
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