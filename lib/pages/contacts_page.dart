import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  final _isLightMode = false;
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: MediaQuery.of(context).size.width*0.4,
                  width: MediaQuery.of(context).size.width*0.4,
                  child:(_isLightMode)
                      ?Image.asset('assets/images/under-construction_lightTheme.png')
                      :Image.asset('assets/images/under-construction_darkTheme.png')),
              const SizedBox(height: 10),
              Text(
                'Page under construction',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,//Color(0xFF0F1828),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
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
