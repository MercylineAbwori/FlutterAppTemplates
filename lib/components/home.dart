

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  HomePage({super.key, 
  
  });


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {

    
    return const Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(child: Text("Home"))
          ],
        ),
      ),

    );
  }
 
}
