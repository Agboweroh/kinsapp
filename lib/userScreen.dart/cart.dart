import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: false,
      ),
      body: Center(
              child: Text("My Cart", style:TextStyle(fontSize: 25.0),
        
        ),
      ),
      
    );
  }
}