import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    Size screenSize;
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("App Admin"),
        elevation: 0.0,
        centerTitle: true,
      ),
      endDrawer: Drawer(child:  Container(
        width: screenSize.width -50.0,
        color: Colors.white,
        child: Column(
          children: <Widget>[
             UserAccountsDrawerHeader(
                          accountName: Text("KinsBizApp"),
                          accountEmail: Text("kinssupport@gmail.com"),
                          currentAccountPicture: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person),
                          )),
                    
          ],
        ),

      ),),
      
      
      body: SingleChildScrollView(
        
              child: Column(
          
          children: <Widget>[
            SizedBox(height: 18.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                maxRadius: 70.0,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(height: 10.0,),
                    Text("Find Orders")

                  ],
                )
              ),
               CircleAvatar(
                maxRadius: 70.0,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(height: 10.0,),
                    Text("Find User")

                  ],
                )
              )
            ],
          ),
          
            SizedBox(height: 18.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                maxRadius: 70.0,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.notification_important),
                    SizedBox(height: 10.0,),
                    Text("App Orders")

                  ],
                )
              ),
               CircleAvatar(
                maxRadius: 70.0,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.chat),
                    SizedBox(height: 10.0,),
                    Text("App Messages")

                  ],
                )
              )
            ],
          ),
          
            SizedBox(height: 18.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                maxRadius: 70.0,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.shop),
                    SizedBox(height: 10.0,),
                    Text("App Products")

                  ],
                )
              ),
               CircleAvatar(
                maxRadius: 70.0,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(height: 10.0,),
                    Text("Add Products")

                  ],
                )
              )
            ],
          ),
          
            SizedBox(height: 18.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                maxRadius: 70.0,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.history),
                    SizedBox(height: 10.0,),
                    Text("Order History")

                  ],
                )
              ),
               CircleAvatar(
                maxRadius: 70.0,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person),
                    SizedBox(height: 10.0,),
                    Text("Privileges")

                  ],
                )
              )
            ],
          ),
          
        ],),
      ),

      
    );
  }
}