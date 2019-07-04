import 'package:flutter/material.dart';
import 'package:kinsapp/tools/progressDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget appTextField(
  {TextEditingController controller,
  IconData textIcon,
  String textHint,
  bool isPassword,
  TextInputType textType,
  double sidePadding}
  ){
    sidePadding==null? sidePadding= 0.0 :sidePadding;
    textHint ==null? textHint ="" :textHint;
    textType ==null? textType =TextInputType.text :textType;
     return Padding(padding:  EdgeInsets.only(left:sidePadding,right: sidePadding),
  child:  Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color:  Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(25.0),
    

      )
      
    ),
    child: Padding(padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      obscureText: isPassword ==null ?false:isPassword,
      keyboardType: textType,
      


    decoration: InputDecoration(border: InputBorder.none,
    hintText: textHint ,
    prefixIcon: textIcon ==null? Container(): Icon(textIcon),
    ),),
  ),
    
  ),
  );
  

}

Widget appButton({String btnText, double btnPadding, Color btnColor, VoidCallback onBtnClicked}){
  btnText ==null? btnText ="App Button":btnText;
  btnPadding ==null? btnPadding =0.0 :btnPadding;
  btnColor == null? btnColor =Colors.black :btnColor;
  
  return Padding(
    padding:  EdgeInsets.all(btnPadding),
    child: RaisedButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      onPressed: onBtnClicked,
      child: Container(
        height: 50.0,
        child: Center(
          child: Text(btnText ,
          style: TextStyle(color: btnColor,fontSize: 18.0),),
        ),
      ),
      ),
  );

}
showSnackBar(String message , final scaffoldKey){
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      
      backgroundColor: Colors.red[600],
      content: Text(
        message??"",
      style:TextStyle(color: Colors.white)),)
  );
}

disPlayProgressDialog(BuildContext context){
  Navigator.of(context).push(PageRouteBuilder(
    opaque: false,
    pageBuilder: (BuildContext context,_,__){
      return ProgressDialog();
    }));

}

writeDataLocally({String key, String value})async{
Future<SharedPreferences>saveLocal =SharedPreferences.getInstance();
final SharedPreferences localdata =await saveLocal;
localdata.setString(key, value);
}
writeBoolLocally({String key, bool value})async{
Future<SharedPreferences>saveLocal =SharedPreferences.getInstance();
final SharedPreferences localdata =await saveLocal;
localdata.setBool(key, value);


}

closeProgressDialog(BuildContext context, ){
  Navigator.of(context).pop();
}

getStringDataLocally({String key}) async{
  Future<SharedPreferences> saveLocal =SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getString(key) ==null ? "":localData.getString(key);

}
  getBooleanDataLocally({String key}) async{
  Future<SharedPreferences> saveLocal =SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getBool(key) == null? false :localData.getBool(key);


}

 getDataLocally({String key}) async{
  Future<SharedPreferences> saveLocal =SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
 }
 clearDataLocally() async{
  Future<SharedPreferences> saveLocal =SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.clear();
  
 }