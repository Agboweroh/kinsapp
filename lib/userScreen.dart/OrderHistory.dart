
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: false,
      ),
      body: Center(
              child: Text("My History Page", style:TextStyle(fontSize: 25.0),
        
        ),
      ),
      
    );
  }
}