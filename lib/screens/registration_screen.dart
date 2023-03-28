import 'package:flash_chat/components/reusable_button.dart';
import 'package:flash_chat/components/reusable_input_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return ReusableInputScreen(
      reusableButton: ReusableButton(
          onPressed: () {},
          backgroundColor: Colors.blueAccent,
          text: 'Register'),
    );
  }
}
