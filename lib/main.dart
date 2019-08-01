import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarab/components/pages/Sign_up.dart';
import 'package:yarab/components/pages/home.dart';

import 'components/pages/sign_in.dart';
//import 'package:yarab/components/pages/signup.dart';
//import './components/pages/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SignUp(),
    );
  }
}
