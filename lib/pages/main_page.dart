import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../helper/helper_function.dart';
import '../providers/theme_changer.dart';
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
  String _themeMode = 'Light';

  @override
  void initState() {
    super.initState();
    getThemeMode();

  }

  void getThemeMode()  {
     HelperFunction.getThemeMode().then((value) => {
          if (value != null) {setState(() => _themeMode = value)}
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    setState(() =>_themeMode = theme.getTheme);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: (selectedIndex == 0)
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  : (_themeMode == 'Light')
                      ? SvgPicture.asset('assets/svg/ic_user_group.svg')
                      : SvgPicture.asset('assets/svg/ic_user_group_white.svg'),
              label: 'Contacts'),
          BottomNavigationBarItem(
              icon: (selectedIndex == 1)
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  : (_themeMode == 'Light')
                      ? SvgPicture.asset('assets/svg/ic_nav_chats.svg')
                      : SvgPicture.asset('assets/svg/ic_nav_chats_white.svg'),
              label: 'Chats'),
          BottomNavigationBarItem(
              icon: (selectedIndex == 2)
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  : (_themeMode == 'Light')
                      ? SvgPicture.asset('assets/svg/ic_more.svg')
                      : SvgPicture.asset('assets/svg/ic_more_white.svg'),
              label: 'More'),
        ],
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(index),
        selectedFontSize: 18,
        unselectedFontSize: 14,
        fixedColor: Theme.of(context).colorScheme.secondary,
        unselectedLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
        selectedLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
        showUnselectedLabels: false,
        showSelectedLabels: true,
      ),
      body: IndexedStack(index: selectedIndex, children: pages),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

}
