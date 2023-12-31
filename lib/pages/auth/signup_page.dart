// import 'package:chat_herd/helper/helper_function.dart';
import 'package:chat_herd/pages/auth/login_page.dart';
import 'package:chat_herd/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../../widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isLoading = false;
  bool _passwordVisiblity = false;
  String? fullName = "";
  String? email = "";
  String? password = "";
  String? cnfPassword = "";
  final formKey = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                    color: Constants.primaryLightColor))
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: 60),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            setState(() {
                              fullName = value;
                            });
                          },
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                          decoration: input(context).copyWith(
                            labelText: 'Full Name',
                            prefixIcon: Icon(
                              Icons.person_rounded,
                              color: Constants.hintColor,
                            ),
                          ),
                          validator: (value) {
                            return (value != "")
                                ? null
                                : "Please enter a Full Name";
                          },
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          validator: (value) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value!)
                                ? null
                                : "Please enter a valid email";
                          },
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                          decoration: input(context).copyWith(
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: Constants.hintColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: !_passwordVisiblity,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          validator: (value) {
                            return RegExp(
                                        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$")
                                    .hasMatch(value!)
                                ? null
                                : "Minimum 8 and maximum 16 characters,\nAt least one uppercase letter,\nOne lowercase letter,\nOne number and one special character:";
                          },
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                          decoration: input(context).copyWith(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.key_rounded,
                              color: Constants.hintColor,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisiblity
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                color: Constants.hintColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisiblity = !_passwordVisiblity;
                                });
                              },
                            ),
                          ),
                        ), //Password
                        const SizedBox(height: 18),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: (value) {
                            return (value == password!)
                                ? null
                                : "Both password should be same";
                          },
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                          decoration: input(context).copyWith(
                            labelText: 'Confirm Password',
                            prefixIcon: Icon(
                              Icons.key_rounded,
                              color: Constants.hintColor,
                            ),
                          ),
                        ), //confirm Password
                        const SizedBox(height: 25),
                        TextButton(
                          onPressed: () => signup(),
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width *
                                double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Constants.primaryLightColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'Sign up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 16,
                                fontFamily: 'Mulish-Reg',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 14,
                                fontFamily: 'Mulish-Light',
                              ),
                            ),
                            InkWell(
                              onTap: () => nextPageReplacement(
                                  context, const LoginInPage()),
                              child: Text(
                                'Login here',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Mulish-Reg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }

  signup() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authServices
          .registerUserWithEmailAndPassword(fullName!, email!, password!)
          .then((value) {
        if (value == true) {
          // HelperFunction.saveUserLoginStatus(true);
          // HelperFunction.saveUserNameSF(fullName!);
          // HelperFunction.saveUserEmailSF(email!);
          showSnackBar(context, const Color(0xff0ab107),
              'Account Signed Up Successfully', 2);
          nextPageReplacement(context, const LoginInPage());

          // setState(() {
          //   _isLoading = false;
          // });
        } else {
          showSnackBar(context, Constants.redColor, value, 10);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
