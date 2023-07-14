import 'package:chat_herd/services/auth_services.dart';
import 'package:chat_herd/widgets/chat_card.dart';
import 'package:chat_herd/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        fontFamily: 'Mulish-Reg',
                        fontWeight: FontWeight.w600,
                        color: Constants.blackColor,
                      ),
                    ),
                    InkWell(
                      onTap: ()=> nextPage(context, const ChatCard()),
                        child: SvgPicture.asset('assets/svg/ic_plus_black.svg')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Container(
                  width: double.maxFinite,
                  height: 36,
                  color: Constants.offWhiteColor,
                  child: Text('hello'),
                ),
              ),
              // ListView.builder(
              //   itemCount: 10,
              //     itemBuilder: (context, index){
              //       chatCard()
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
