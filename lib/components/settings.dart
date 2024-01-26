import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(child: Text("Settings"))
          ],
        ),
      ),
    );
  }

 



}