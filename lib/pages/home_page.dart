import 'package:chat_herd/services/auth_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:ElevatedButton(
          onPressed: () => authServices.signOut(),
          child: Text('SignOut'),
        ),
        ),
    );
  }
}
