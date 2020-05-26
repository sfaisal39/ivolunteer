import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivolunteer/src/pages/LoginPage.dart';
import 'package:ivolunteer/src/values/AppColors.dart';
import 'package:ivolunteer/src/values/AppStrings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.APP_NAME,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: AppColors.PRIMARY_COLOR_DARK),
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(body:  LoginPage()),
    );
  }
}
