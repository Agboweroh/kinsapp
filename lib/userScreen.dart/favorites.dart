
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: false,
      ),
      body: Center(
              child: Text("My Favorites Store", style:TextStyle(fontSize: 25.0),
        
        ),
      ),
      
    );
  }
}