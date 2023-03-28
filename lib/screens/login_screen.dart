import 'package:flash_chat/components/reusable_button.dart';
import 'package:flutter/material.dart';
import '';
import '../components/reusable_input_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ReusableInputScreen(
      reusableButton: ReusableButton(
          onPressed: () {},
          backgroundColor: Colors.lightBlueAccent,
          text: 'Log In'),
    );
  }
}
