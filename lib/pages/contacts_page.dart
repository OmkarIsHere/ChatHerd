import 'package:flutter/material.dart';

import '../shared/constants.dart';
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.width*0.8,
          width: MediaQuery.of(context).size.width*0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/under_construction_lightTheme.png'),
              const SizedBox(height: 10),
              Text(
                'Page under construction',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Constants.blackColor,//Color(0xFF0F1828),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Mulish-Reg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
