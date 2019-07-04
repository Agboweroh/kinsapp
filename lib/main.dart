 
import 'package:flutter/material.dart';
import 'package:kinsapp/userScreen.dart/homePage.dart';


void main() =>runApp(MyApp());
  


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BusinessApp",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}