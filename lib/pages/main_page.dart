import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../shared/constants.dart';
import 'contacts_page.dart';
import 'home_page.dart';
import 'more_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 1;
  var pages = [const ContactPage(), const HomePage(), const MorePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: (selectedIndex == 0)
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Constants.blackColor),
                    )
                  : SvgPicture.asset('assets/svg/ic_user_group.svg'),
              label: 'Contacts'),
          BottomNavigationBarItem(
              icon: (selectedIndex == 1)
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Constants.blackColor),
                    )
                  : SvgPicture.asset('assets/svg/ic_nav_chats.svg'),
              label: 'Chats'),
          BottomNavigationBarItem(
              icon: (selectedIndex == 2)
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Constants.blackColor),
                    )
                  : SvgPicture.asset('assets/svg/ic_more.svg'),
              label: 'More'),
        ],
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(index),
        selectedFontSize: 18,
        unselectedFontSize: 14,
        fixedColor: Constants.blackColor,
        unselectedLabelStyle: TextStyle(color: Constants.blackColor),
        selectedLabelStyle: TextStyle(color: Constants.blackColor),
        showUnselectedLabels: false,
        showSelectedLabels: true,
      ),
      body: IndexedStack(index: selectedIndex,children: pages),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
