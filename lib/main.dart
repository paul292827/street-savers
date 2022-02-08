import 'package:flutter/material.dart';

import 'src/homePage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Street Savers Application',
      //debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}