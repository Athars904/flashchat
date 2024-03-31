import 'package:flashchat/constants.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class RegistrationScreen extends StatefulWidget {
  static const String id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
   late String email;
   late String password;
   bool showSpinner=false;
   final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(

                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;
                  //Do something with the user input.
                },
                decoration: kInputDecorationStyle.copyWith(hintText: 'Enter your email address'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password=value;
                  //Do something with the user input.
                },
                decoration: kInputDecorationStyle.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(title: 'Register', color: Colors.blueAccent,
                  onPressed: () async{
                setState(() {
                  showSpinner=true;
                });
                try {
                  final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    Navigator.pushNamed(context, ChatScreen.id);
                } catch (e) {
                  print(e);
                }
                setState(() {
                  showSpinner=false;
                });

              })
            ],
          ),
        ),
      ),
    );
  }
}
