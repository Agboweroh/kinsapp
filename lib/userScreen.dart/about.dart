import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: false,
      ),
      body: Center(
              child: Text("About Us Page", style:TextStyle(fontSize: 25.0),
        
        ),
      ),
      
    );
  }
}