import 'package:flash_chat/components/reusable_button.dart';
import 'package:flutter/material.dart';
import '../components/reusable_input_screen.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return ReusableInputScreen(
      field1: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        style: kTextFieldStyle,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: kInputDecTextField.copyWith(
            hintText: 'Enter your email', labelText: 'Email'),
      ),
      field2: TextField(
        textAlign: TextAlign.center,
        style: kTextFieldStyle,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: kInputDecTextField.copyWith(
            hintText: 'Enter your password', labelText: 'Password'),
      ),
      reusableButton: ReusableButton(
          onPressed: () {},
          backgroundColor: Colors.lightBlueAccent,
          text: 'Log In'),
    );
  }
}
