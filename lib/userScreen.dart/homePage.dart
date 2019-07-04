import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kinsapp/adminScreens/adminHome.dart';
import 'package:kinsapp/mystore/store.dart';
import 'package:kinsapp/tools/app_data.dart';
import 'package:kinsapp/tools/appmethods.dart';
import 'package:kinsapp/tools/apptools.dart';
import 'package:kinsapp/tools/firebaseMethods.dart';
import 'package:kinsapp/userScreen.dart/OrderHistory.dart';
import 'package:kinsapp/userScreen.dart/about.dart';
import 'package:kinsapp/userScreen.dart/cart.dart';
import 'package:kinsapp/userScreen.dart/deliveryAddress.dart';
import 'package:kinsapp/userScreen.dart/items_details.dart';
import 'package:kinsapp/userScreen.dart/login.dart';
import 'package:kinsapp/userScreen.dart/messages.dart';
import 'package:kinsapp/userScreen.dart/notification.dart';
import 'package:kinsapp/userScreen.dart/profileSetting.dart';
import 'favorites.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;
  String acctName = "";
  String acctEmail = "";
  String acctPhotoUrl = "";
  bool isLoggedIn;
  AppMethods appMethods = FirebaseMethods();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future getCurrentUser() async {
    acctName = await getStringDataLocally(key: acctFullName);
    acctEmail = await getStringDataLocally(key: userEmail);
    acctPhotoUrl = await getStringDataLocally(key: photoUrl);
    isLoggedIn = await getBooleanDataLocally(key: isLoggedIN);
    acctName == null ? acctName = "Guest User" : acctName;
    acctEmail == null ? acctEmail = "guestuser@email.com" : acctEmail;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onLongPress: openAdmin,
                    child: Text("BusinessApp")),
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context)
                            .push(CupertinoPageRoute(builder: (BuildContext context) {
                          return Favorites();
                        }));
                      },
                    ),
                    Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.chat, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context)
                                .push(CupertinoPageRoute(builder: (BuildContext context) {
                              return Messages();
                            }));
                          },
                        ),
                        CircleAvatar(
                          radius: 8.0,
                          child: Text("0",
                              style: TextStyle(color: Colors.white, fontSize: 12.0)),
                          backgroundColor: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
                body: Center(
                    child: Column(
                  children: <Widget>[
                    Flexible(
                        child: GridView.builder(
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: storeItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ItemDetails(
                                      itemImage: storeItems[index].itemImage,
                                      itemName: storeItems[index].itemName,
                                      itemPrice: storeItems[index].itemPrice,
                                      itemrating: storeItems[index].itemrating,
                                    )));
                          },
                          child: Card(
                            child: Stack(
                              alignment: FractionalOffset.topLeft,
                              children: <Widget>[
                                Stack(
                                  alignment: FractionalOffset.bottomCenter,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: NetworkImage(storeItems[index].itemImage),
                                      )),
                                    ),
                                    Container(
                                      height: 35.0,
                                      color: Colors.black.withAlpha(100),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "${storeItems[index].itemName.substring(0, 4)}...",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16.0,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "N ${storeItems[index].itemPrice} ",
                                              style: TextStyle(
                                                  color: Colors.red[500],
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      height: 30.0,
                                      width: 60.0,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5.0),
                                              bottomRight: Radius.circular(5.0))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.blue,
                                            size: 20.0,
                                          ),
                                          Text(
                                            "${storeItems[index].itemrating}",
                                            style: TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {},
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                  ],
                )),
                floatingActionButton: Stack(
                  children: <Widget>[
                    FloatingActionButton(
                      child: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context)
                            .push(CupertinoPageRoute(builder: (BuildContext context) {
                          return Cart();
                        }));
                      },
                    ),
                    CircleAvatar(
                      radius: 10.0,
                      child: Text("0",
                          style: TextStyle(color: Colors.white, fontSize: 12.0)),
                      backgroundColor: Colors.red,
                    )
                  ],
                ),
                drawer: Drawer(
                  child: Column(
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                          accountName: Text(acctName),
                          accountEmail: Text(acctEmail),
                          currentAccountPicture: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person),
                          )),
                      ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                          title: Text("Order Notifications"),
                          onTap: () {
                            Navigator.of(context)
                                .push(CupertinoPageRoute(builder: (BuildContext context) {
                              return MyNotification();
                            }));
                          }),
                      ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                        title: Text("Order History"),
                        onTap: () {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (BuildContext context) {
                            return History();
                          }));
                        },
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                        title: Text("Profile Settings"),
                        onTap: () {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (BuildContext context) {
                            return Profile();
                          }));
                        },
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                        title: Text("Delivery Address"),
                        onTap: () {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (BuildContext context) {
                            return Delivery();
                          }));
                        },
                      ),
                      ListTile(
                        trailing: CircleAvatar(
                          child: Icon(
                            Icons.help,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                        title: Text("About Us"),
                        onTap: () {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (BuildContext context) {
                            return About();
                          }));
                        },
                      ),
                      ListTile(
                        trailing: CircleAvatar(
                          child: Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                        title: Text(isLoggedIn == true ? "Logout" : "Login"),
                        onTap: checkIfLoggedIn,
                      ),
                    ],
                  ),
                ),
              );
            }
          
            checkIfLoggedIn() async {
              if (isLoggedIn ==false) {
                bool response = await Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (BuildContext context) {
                  return Login();
                }));
                if (response == true) getCurrentUser();
          
                return;
              }
              bool response = await appMethods.logoutUser();
              if (response == true) {
                getCurrentUser();
              }
            }
          
             openAdmin() {
               Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return AdminHome();
                }));

  }
}
