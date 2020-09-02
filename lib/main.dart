import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/screens/account%20setup.dart';

import 'package:flutterapp/screens/home.dart';
import 'package:flutterapp/screens/introscreen.dart';
import 'package:flutterapp/screens/loging.dart';
import 'package:flutterapp/screens/profile.dart';




void main() {
  runApp(MaterialApp(
    home:screen(),
    ),
  );

}
class screen extends StatefulWidget {
  @override
  _screenState createState() => _screenState();
}

class _screenState extends State<screen> {
  bool auth = false;

  @override
  Widget build(BuildContext context) {
    //remeber to cahage it back to Home()
    return auth==true?Home():Intro();
  }
  @override
  void initState() {
    // TODO: implement initState.0
    super.initState();
    handleauth();
  }

  void handleauth() {
    FirebaseAuth.instance.onAuthStateChanged.listen((event) {
      if( event != null ){
        setState(() {
          auth = true;
        });
      }else{
        setState(() {
          auth = false;
        });
      }
    });
  }
}


