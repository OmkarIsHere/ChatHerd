import 'package:flutter/material.dart';
import '../shared/constants.dart';

InputDecoration input(BuildContext context){
 // final textInputDecoration =
 return InputDecoration(
   filled: true,
   fillColor:Theme.of(context).colorScheme.surface,
  labelStyle: TextStyle(
    color: Constants.hintColor,
  ),
   enabledBorder: OutlineInputBorder(
     borderSide: BorderSide(
       color: Theme.of(context).colorScheme.surface,
       width: 2,
     ),
   ),
   focusedBorder: OutlineInputBorder(
     borderSide: BorderSide(
      color: Constants.greyColor,
      width: 2,
     ),
   ),
   errorBorder: OutlineInputBorder(
     borderSide: BorderSide(
      color: Constants.redColor,
      width: 2,
     ),
   ),
   focusedErrorBorder: OutlineInputBorder(
     borderSide: BorderSide(
       color: Constants.greyColor,
       width: 2,
     ),
   ),
);
}

void nextPage(context, page){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> page));
}
void nextPageReplacement(context, page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> page));
}

void showSnackBar(context, color, message, time){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(message,style: TextStyle(fontSize: 14, color: Constants.whiteColor),),
        backgroundColor: color,
    duration:Duration(seconds: time),
    action: SnackBarAction(label: 'Ok',textColor: color, backgroundColor: Constants.whiteColor, onPressed: (){}),
    ),
  );
}