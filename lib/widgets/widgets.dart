import 'package:flutter/material.dart';
import '../shared/constants.dart';

 final textInputDecoration = InputDecoration(
   filled: true,
   fillColor: Constants.offWhiteColor,
  labelStyle: TextStyle(
    color: Constants.hintColor,
  ),
   enabledBorder: OutlineInputBorder(
     borderSide: BorderSide(
       color: Constants.offWhiteColor,
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

void chatCard(String? name,String? lastSeen, bool isImage,[image]){
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Athalia Putri',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.3,
                          // backgroundColor: Colors.yellow,
                          fontFamily: 'Mulish-Reg',
                          color: Constants.blackColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Last seen yesterday',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.1,
                          // backgroundColor: Colors.red,
                          fontFamily: 'Mulish-Reg',
                          color: Constants.greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              height: 2,
              thickness: 1,
              color: Constants.offWhiteColor,
            )
          ],
        ),
      ),
    );
}

}