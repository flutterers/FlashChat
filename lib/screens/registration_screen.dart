import 'package:flash_chat/components/reusable_button.dart';
import 'package:flash_chat/components/reusable_input_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    return ReusableInputScreen(
      field1: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        style: kTextFieldStyle,
        onChanged: (value) {
          setState(() {
            _email = value;
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
            _password = value;
          });
        },
        decoration: kInputDecTextField.copyWith(
            hintText: 'Enter your password', labelText: 'Password'),
      ),
      reusableButton: ReusableButton(
        text: 'Register',
        backgroundColor: Colors.blueAccent,
        onPressed: () async {
          print(_email);
          print(_password);

          try {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: _email, password: _password);
            if (newUser != null) {
              Navigator.pushNamed(context, ChatScreen.id);
            }
          } on Exception catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
