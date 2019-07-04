import 'package:flutter/material.dart';
import 'package:kinsapp/tools/app_data.dart';
import 'package:kinsapp/tools/apptools.dart';
import 'package:kinsapp/tools/firebaseMethods.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController phonenumber =TextEditingController();
  TextEditingController password =TextEditingController();
 TextEditingController rpassword =TextEditingController();
  FirebaseMethods appMethods = FirebaseMethods();
  
 
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext context;
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
             textHint: " Enter full name",
             textIcon: Icons.person,controller: fullname,
           ),
            SizedBox(height: 30.0,),
           appTextField(
             isPassword: false,
             sidePadding: 18.0,
             textHint: " Enter Email Address",
             textIcon: Icons.email,controller: email,
           ),
            SizedBox(height: 30.0,),
           appTextField(
             isPassword: false,
             sidePadding: 18.0,
             textHint: " Enter phone number",
             textIcon: Icons.phone,controller: phonenumber,
             textType: TextInputType.number,
           ),
           SizedBox(height: 30.0,),
           appTextField(
             isPassword: true,
             sidePadding: 18.0,
             textHint: "Enter password",
             textIcon: Icons.lock, controller: password,
           ),
           SizedBox(height: 30.0,),
           appTextField(
             isPassword: true,
             sidePadding: 18.0,
             textHint: "Re-enter password",
             textIcon: Icons.lock, controller: rpassword,
           ),
           SizedBox(height: 30,),
           appButton(
             btnText: "Create Account",onBtnClicked: verifyDetails,
             btnColor: Theme.of(context).primaryColor,
           ),
           
          ],
        ),
      )
      
    );
  }

  verifyDetails()async{
    if(fullname.text ==""){
      showSnackBar("Full name  cannot be empty", scaffoldKey);
      return;

    }
    if(email.text ==""){
      showSnackBar("Email  cannot be empty", scaffoldKey);
      return;

    }
    if(phonenumber.text ==""){
      showSnackBar("Phone number cannot be empty", scaffoldKey);
      return;

    }
    if(password.text ==""){
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;

    }
    if(rpassword.text ==""){
      showSnackBar("password field  cannot be empty", scaffoldKey);
      return;

    }
    if(password.text !=rpassword.text){
      showSnackBar("passwords don't match", scaffoldKey);
      return;

    }
    disPlayProgressDialog(context);
    String response = await appMethods.createUserAccount(
      fullname: fullname.text,email: email.text.toLowerCase(),
      phoneNumber: phonenumber.text,password: password.text.toLowerCase());
      if(response==successful){
         closeProgressDialog(context);
         Navigator.of(context).pop();
         Navigator.of(context).pop(true);
      
       }else{
         closeProgressDialog(context);
         showSnackBar(response, scaffoldKey);

       }
  }
      
   
  
}