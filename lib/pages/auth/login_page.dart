import 'package:chat_herd/pages/auth/signup_page.dart';
import 'package:chat_herd/shared/constants.dart';
import 'package:chat_herd/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginInPage extends StatefulWidget {
  const LoginInPage({super.key});

  @override
  State<LoginInPage> createState() => _LoginInPageState();
}

class _LoginInPageState extends State<LoginInPage> {
  bool _passwordVisiblity = false;
  String? email = "";
  String? password = "";
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 30),
          child: Form(
            key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mulish-Reg',
                        ),
                      ),
                    SizedBox(height:MediaQuery.of(context).size.width * 0.2 ,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value){
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)?null :"Please enter a valid email";
                      },
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_rounded, color: Constants.hintColor,),
                      ),
                    ),
                    const SizedBox(height: 18,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: !_passwordVisiblity,
                      onChanged: (value){
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value){
                        return (value!.length >= 8) ?null :"The password must be at least of 8 character";
                      },
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.key_rounded, color: Constants.hintColor,),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisiblity?Icons.visibility_rounded: Icons.visibility_off_rounded, color: Constants.hintColor,
                          ), onPressed: () {
                          setState(() {
                            _passwordVisiblity = !_passwordVisiblity;
                          });
                        },
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    TextButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){}
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.95,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Constants.primaryLightColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child:Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.whiteColor,
                            fontSize: 16,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Light',
                          ),
                        ),
                        InkWell(
                          onTap: () => nextPage(context, const SignUpPage()),
                          child: Text(
                            'Sign up here',
                            style: TextStyle(
                              color: Constants.primaryLightColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Mulish-Reg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
