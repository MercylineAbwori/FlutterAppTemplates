

import 'package:flutter/material.dart';

class MultiImagePickerPage extends StatefulWidget {
  
  MultiImagePickerPage({super.key, 
  
  });


  @override
  State<MultiImagePickerPage> createState() => _MultiImagePickerPageState();
}

class _MultiImagePickerPageState extends State<MultiImagePickerPage> {
  
  @override
  Widget build(BuildContext context) {

    
    return const Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(child: Text("Default"))
          ],
        ),
      ),

    );
  }
 
}
