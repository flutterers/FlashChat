import 'package:flash_chat/components/reusable_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart'
    '';

class ReusableInputScreen extends StatelessWidget {
  const ReusableInputScreen({
    super.key,
    required this.reusableButton,
    required this.field1,
    required this.field2,
  });

  final ReusableButton reusableButton;
  final TextField field1;
  final TextField field2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            field1,
            const SizedBox(
              height: 8.0,
            ),
            field2,
            const SizedBox(
              height: 24.0,
            ),
            reusableButton,
          ],
        ),
      ),
    );
  }
}
