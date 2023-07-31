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
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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

  final myLightTheme = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: const Color(0xFF696969),
      statusBarColor: const Color(0xFFFFFFFF));
  final myDarkTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: const Color(0xFF0F1828),
      statusBarColor: const Color(0xFF0F1828));
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() {
    HelperFunction.getUserLoggedInState().then((value) {
      if (value != null) {
        setState(() {
          _signedIn = value;
        });

        Future.delayed(
            const Duration(seconds: 3), () => FlutterNativeSplash.remove());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final String themeMode = theme.getTheme;
    (themeMode == 'Light')
        ? SystemChrome.setSystemUIOverlayStyle(myLightTheme)
        : SystemChrome.setSystemUIOverlayStyle(myDarkTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: (themeMode == 'Light') ? lightTheme : darkTheme,
      home: _signedIn ? const MainPage() : const OnBoarding(),
    );
  }
}
