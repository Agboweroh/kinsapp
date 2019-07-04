import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: false,
      ),
      body: Center(
              child: Text("My Profile account", style:TextStyle(fontSize: 25.0),
        
        ),
      ),
      
    );
  }
}