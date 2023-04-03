import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/reusable_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../components/reusable_input_screen.dart';
import '../constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email;
  late String _password;
  late final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _saving = false;

  @override
  // TODO: implement mounted
  bool get mounted => super.mounted;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _saving,
      child: ReusableInputScreen(
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
          backgroundColor: Colors.lightBlueAccent,
          text: 'Log In',
          onPressed: () async {
            try {
              setState(() {
                _saving = true;
              });

              UserCredential userCred = await _auth.signInWithEmailAndPassword(
                  email: _email, password: _password);

              setState(() {
                _saving = false;
              });
              Navigator.pushNamed(context, ChatScreen.id);
            } on Exception catch (e) {
              print(e);
            }
          },
        ),
      ),
    );
  }
}
