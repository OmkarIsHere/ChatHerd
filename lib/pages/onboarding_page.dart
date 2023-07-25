import 'package:chat_herd/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../providers/theme_changer.dart';
import '../shared/constants.dart';
import '../widgets/widgets.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
      String _themeMode = 'Light';
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    setState(() =>_themeMode = theme.getTheme);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children:[
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child:(_themeMode == 'Light')
                    ?SvgPicture.asset('assets/svg/img_group_light.svg')
                    :SvgPicture.asset('assets/svg/img_group_dark.svg'),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.18,
                    vertical: 30),
                child: Text(
                  'Connect easily with your community and friends over countries',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,//Color(0xFF0F1828),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
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
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14,
                      height: 1.5,
                      fontFamily: 'Mulish-light',
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TextButton(
                    onPressed: () => nextPageReplacement(context,const LoginInPage()),
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
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
