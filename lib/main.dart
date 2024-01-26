import 'package:flutter/material.dart';
import 'package:flutter_app_template/common_ui.dart';
import 'package:flutter_app_template/shared/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
        primarySwatch: Palette.kToDarkBlack
        
      ),
      home: const CommonUIPage(title: 'Flutter Demo Home Page'),
    );
  }
}


