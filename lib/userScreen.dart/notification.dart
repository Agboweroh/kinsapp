import 'package:flutter/material.dart';

class MyNotification extends StatefulWidget {
  @override
  _MyNotificationState createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: false,
      ),
      body: Center(
              child: Text("My Notifications", style:TextStyle(fontSize: 25.0),
        
        ),
      ),
      
    );
  }
}