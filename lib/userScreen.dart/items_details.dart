import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kinsapp/userScreen.dart/cart.dart';

class ItemDetails extends StatefulWidget {
 final  String itemName;
  final String itemImage;
 final  String itemSubName;
 final  double itemPrice;
 final  double itemrating;
  ItemDetails({
    this.itemImage,
    this.itemName,
    this.itemPrice,
    this.itemrating,
    this.itemSubName
  });


  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Item Details"),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white),

      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.itemImage),
              fit: BoxFit.fitHeight),borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(120.0),
                bottomLeft: Radius.circular(120.0)
                )
            ),
          ),
          Container(
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(50),

              
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(120.0),
                bottomLeft: Radius.circular(120.0)
                )
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0,),
                      Text(widget.itemName,style:TextStyle(fontSize:18.0, fontWeight:FontWeight.w700)),
                      SizedBox(height: 10.0,),
                      Text("Item Sub Name",style:TextStyle(fontSize:14.0, fontWeight:FontWeight.w400)),
                      SizedBox(height: 10.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.star,color:Colors.blue , size: 20.0,),
                              Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("${widget.itemrating}",style: TextStyle(color: Colors.blue ,fontSize: 14),)
                               ],
                          )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("N${widget.itemPrice}",style: TextStyle(color: Colors.red ,fontSize: 30),)
                               ],
                          )
                          
                        ],
                      )
                    ],
                    ),
                    

                  ),
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    height: 150.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,

                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5.0,right: 5.0),
                              height: 140.0,
                              width: 100.0,
                              child: Image.network(widget.itemImage),

                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.0,right: 5.0),
                              height: 140.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.grey.withAlpha(50)
                              ),
                            )
                          ],
                        );
                      },),
                  ),
                ),
                Card(
                  child: Container(
                    width:screenSize.width,
                    margin: EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10.0,),
                        Text("Description" ,style:TextStyle(fontSize: 18.0, fontWeight:FontWeight.w700),
                        
                        ),
                        SizedBox(height: 10.0,),
                        Text(" Item full Information" ,style:TextStyle(fontSize: 15.0 , fontWeight:FontWeight.w700)),
                        SizedBox(height: 10.0,),

                      ],
                    ),
                  ),

                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[

                        SizedBox(height: 10.0,),
                        Text("Colors" ,style:TextStyle(fontWeight: FontWeight.w700 ,fontSize:18)),
                        SizedBox(height: 10.0,),
                        SizedBox(height: 50.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4, itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(4.0),
                              child: ChoiceChip(
                                label: Text("Color $index"),
                                selected: false,
                                
                              ),
                            );
                          },
                          
                        ),
                        ),
                        SizedBox(height: 10.0,),
                        Text("Sizes", style:TextStyle(fontWeight: FontWeight.w700,fontSize:18.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4, itemBuilder: (BuildContext context, int index) {
                              return Padding(padding: const EdgeInsets.all(4.0),
                              child: ChoiceChip(label: Text("Sizes $index"), selected: false,),

                              );
                              
                              
                            },
                          )
                           
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text("Sizes",style:TextStyle(fontWeight: FontWeight.w700 ,fontSize:18.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircleAvatar(
                              child: Icon(Icons.remove),
                              
                            ),
                            Text("0"),
                            CircleAvatar(
                              child: Icon(Icons.add),
                            ),
                            SizedBox(height: 50.0,)
                          ],

                        )
                        
                        
                        
                      ],
                    ),
                  ),

                )

              ],
            ),
          )
        ],
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.shopping_cart),
           onPressed: () {
             
            Navigator.of(context).push(CupertinoPageRoute(
               builder: (BuildContext context ){
                 return Cart();
                 
               }));
           },),
           CircleAvatar(
               radius: 10.0,
               child: Text("0" ,style:TextStyle(color: Colors.white, fontSize: 12.0)),
               backgroundColor: Colors.red,)
             
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      color: Theme.of(context).primaryColor,
      elevation: 0.0,
      shape: CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: (screenSize.width-20)/2,
            child: Text("ADD TO FAVORITES",textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
            
          ),
           Container(
            width: (screenSize.width-20)/2,
            child: Text("ORDER NOW",textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
            
          )
        ],
        
        ),
        
      ),
    ),
      
      
    );
  }
}