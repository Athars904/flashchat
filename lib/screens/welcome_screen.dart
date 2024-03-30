import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class WelcomeScreen extends StatefulWidget {
  static const String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {

    super.initState();
    controller=AnimationController(vsync: this,duration:Duration(seconds: 1),);
    animation=ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],

                  totalRepeatCount: 1,
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Login',color: Colors.lightBlueAccent,onPressed:() {
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(title: 'Register', color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                })
          ],
        ),
      ),
    );
  }
}