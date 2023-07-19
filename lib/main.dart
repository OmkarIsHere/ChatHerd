import 'package:chat_herd/helper/helper_function.dart';
import 'package:chat_herd/pages/home_page.dart';
import 'package:chat_herd/pages/main_page.dart';
import 'package:chat_herd/pages/onboarding_page.dart';
import 'package:chat_herd/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _signedIn = false;

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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _signedIn ? const MainPage() : const OnBoarding(),
    );
  }
}
