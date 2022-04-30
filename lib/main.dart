import 'package:donban/pages/splash/splash_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}


class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // false 禁用角标
      theme: ThemeData(backgroundColor: Colors.white),
      home: Scaffold(
        body: SplashWidget(),
      ),
    );
  }
}