

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  
  ProfilePage({super.key, 
  
  });


  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  @override
  Widget build(BuildContext context) {

    
    return const Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(child: Text("Profile"))
          ],
        ),
      ),

    );
  }
 
}
