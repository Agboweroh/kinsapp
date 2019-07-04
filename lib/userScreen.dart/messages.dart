
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        centerTitle: false,
      ),
      body: Center(
              child: Text("My Messages", style:TextStyle(fontSize: 25.0),
        
        ),
      ),
      
    );
  }
}