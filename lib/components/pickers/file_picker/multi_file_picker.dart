

import 'package:flutter/material.dart';

class MultiFilePickerPage extends StatefulWidget {
  
  MultiFilePickerPage({super.key, 
  
  });


  @override
  State<MultiFilePickerPage> createState() => _MultiFilePickerPageState();
}

class _MultiFilePickerPageState extends State<MultiFilePickerPage> {
  
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
