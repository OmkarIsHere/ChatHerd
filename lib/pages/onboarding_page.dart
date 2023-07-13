import 'package:chat_herd/helper/helper_function.dart';
import 'package:chat_herd/pages/auth/login_page.dart';
import 'package:chat_herd/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/constants.dart';
import '../widgets/widgets.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggedInState();
  }
  void getUserLoggedInState() async{
    await HelperFunction.getUserLoggedInState().then((value) {
      if(value!=null){
        _isSignedIn = value;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children:[
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: SvgPicture.asset('assets/svg/img_group_light.svg'),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.18,
                    vertical: 30),
                child: Text(
                  'Connect easily with your family and friends over countries',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Constants.blackColor,//Color(0xFF0F1828),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mulish-Reg',
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Column(
                children: [
                   Text(
                    'Terms & Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 14,
                      height: 1.5,
                      fontFamily: 'Mulish-light',
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TextButton(
                    onPressed: () => _isSignedIn ? nextPageReplacement(context,const HomePage()) : nextPageReplacement(context,const LoginInPage()),//() {
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => _isSignedIn? const HomePage():const LoginInPage()));
                    // },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Constants.primaryLightColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:Text(
                        'Start Messaging',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.whiteColor,
                          fontSize: 16,
                          fontFamily: 'Mulish-Reg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

}
