import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery"),
        centerTitle: false,
      ),
      body: Center(
              child: Text("My Delivery", style:TextStyle(fontSize: 25.0),
        
        ),
      ),
      
    );
  }
}