

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerPage extends StatefulWidget {
  
  ImagePickerPage({super.key, 
  
  });


  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {

  File? _image;
  String? _imageName;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File("${directory.path}/$name");
    setState(() {
      _imageName = name;
    });

    return File(imagePath).copy(image.path);
  }


  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.attach_file)
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Attach Photo',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
            
            const SizedBox(
              width: 10.0,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: DottedBorder(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        (_image != null)?
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10,),
                                Center(
                                  child: Container(
                                    height: 120,
                                    width: 150,
                                    child: Image.file(_image!, height: 150, width: 150, fit: BoxFit.fill),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    color: Colors.grey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                        child: Text(_imageName!,
                                            style: const TextStyle(
                                                fontSize: 13, fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ):
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10,),
                                Center(
                                  child: Image.asset(
                                    'assets/images/upload_logo.png',
                                    width: 300,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        
                        
                        Column(
                          children: [
                            CustomButton(
                              title:
                                  'Pick from Gallery',
                              icon:
                                  Icons.image_outlined,
                              onClick: () =>
                                  getImage(
                                      ImageSource
                                          .gallery),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              title: 'Pick from Camera',
                              icon: Icons.camera,
                              onClick: () =>
                                  getImage(
                                      ImageSource
                                          .camera),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ]
                    )
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),

    );
  }
 
}

Widget CustomButton(
    {required String title,
    required IconData icon,
    required VoidCallback onClick}) {
  return Container(
    width: 200,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Text(title)
        ],
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    ),
  );
}
