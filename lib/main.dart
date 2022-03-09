import 'package:flutter/material.dart';
import 'package:sports/views/home.dart';
import 'package:http/http.dart' as http;
import 'package:sports/views/splash.dart';
import 'dart:convert' as convert;

import 'Model/feedback_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // UserSheetApi.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BC Sports Betting',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
