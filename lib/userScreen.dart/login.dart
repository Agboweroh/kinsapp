import 'package:flutter/material.dart';
import 'package:kinsapp/tools/app_data.dart';
import 'package:kinsapp/tools/apptools.dart';
import 'package:kinsapp/tools/firebaseMethods.dart';
import 'package:kinsapp/userScreen.dart/signUp.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password =TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext context;
  FirebaseMethods appMethods = FirebaseMethods();
  @override
 Widget build(BuildContext context) {
   this.context =context; 
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Login"),
        centerTitle: false,
        
      ),
      
      body: SingleChildScrollView(
        child: Column(
          
          children: <Widget>[
            SizedBox(height: 30.0,),
           appTextField(
             isPassword: false,
             sidePadding: 18.0,
             textHint: "Email Address",
             textIcon: Icons.email,controller: email,
           ),
           SizedBox(height: 30.0,),
           appTextField(
             isPassword: true,
             sidePadding: 18.0,
             textHint: "password",
             textIcon: Icons.lock, controller: password,
           ),
           SizedBox(height: 30,),
           appButton(
             btnText: "Login",onBtnClicked: verifyLoggin,
             btnColor: Theme.of(context).primaryColor,
           ),
           SizedBox(height: 30.0,),
           GestureDetector(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));

             },
               child: Text("Not Registered? signUp Here ",
               style:TextStyle(color:Colors.white)),
           )
          ],
        ),
      )
      
    );
  }

  verifyLoggin() async{
    if(email.text ==""){
      showSnackBar("email cannot be empty", scaffoldKey);
      return;

    }
    if(email.text ==""){
      showSnackBar("password cannot be empty", scaffoldKey);
      return;

    }
    disPlayProgressDialog(context);
       String response= await   appMethods.logginUser(email: email.text.toLowerCase(), 
       password: password.text.toLowerCase());
       if(response==successful){
         closeProgressDialog(context);
         Navigator.of(context).pop(true);
       }else{
         closeProgressDialog(context);
         showSnackBar(response, scaffoldKey);

       }

  }
}