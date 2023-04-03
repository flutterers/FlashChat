import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/reusable_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation animation2;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    controller.forward();

    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    animation2 = ColorTween(begin: Colors.orange.shade400, end: Colors.white)
        .animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation2.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: SizedBox(
                      // height: 60.0,
                      height: animation.value * 100,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            ReusableButton(
                onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
                backgroundColor: Colors.lightBlueAccent,
                text: 'Log In'),
            ReusableButton(
                backgroundColor: Colors.blueAccent,
                onPressed: () =>
                    Navigator.pushNamed(context, RegistrationScreen.id),
                text: 'Register'),
          ],
        ),
      ),
    );
  }
}
