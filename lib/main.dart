import 'package:chat_herd/helper/helper_function.dart';
import 'package:chat_herd/pages/main_page.dart';
import 'package:chat_herd/pages/onboarding_page.dart';
import 'package:chat_herd/providers/theme_changer.dart';
import 'package:chat_herd/shared/constants.dart';
import 'package:chat_herd/themes/dark_theme.dart';
import 'package:chat_herd/themes/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderID,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyThemeApp());
}
class MyThemeApp extends StatelessWidget {
  const MyThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: const MyApp(),
    );
  }
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _signedIn = false;
  // String _themeMode = 'Dark';

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() {
    HelperFunction.getUserLoggedInState().then((value) => {
          if (value != null)
            {
              setState(() {
                _signedIn = value;
              })
            }
        });
    // HelperFunction.getThemeMode().then((value) => {
    //   if (value != null)
    //     {
    //       setState(() {
    //         _themeMode = value;
    //       })
    //     }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final String themeMode = theme.getTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: (themeMode == 'Light')?lightTheme:darkTheme,
      home: _signedIn ? const MainPage() : const OnBoarding(),
    );
  }
}
