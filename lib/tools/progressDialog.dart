import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withAlpha(200),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
         child: GestureDetector(
           onTap: (){
             Navigator.pop(context);
           },
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 CircularProgressIndicator(),
                 SizedBox(height: 15.0,),
                 Text("Please Wait...",
                 style:TextStyle(fontWeight:FontWeight.w700,fontSize: 16.0,color: Colors.white))
               ],
             ),
           ),
         )
        ),
      ),      
    );
  }
}