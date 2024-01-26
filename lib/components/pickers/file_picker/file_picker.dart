

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/shared/download_file/download_progress_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickerPage extends StatefulWidget {
  
  FilePickerPage({super.key, 
  
  });


  @override
  State<FilePickerPage> createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {

  File? file;
  FilePickerResult? result;

	
  
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
                    'Attach File',
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
                child: Column(
                  children: [
                    DottedBorder(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          children: [
                            (result != null || file != null)?
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10,),
                                    ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: result?.files.length ?? 0,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            // onTap: () => OpenAppFile.open(result?.files[index].path.toString()),

                                            title:
                                                Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Icon(
                                                  Icons.file_open,
                                                  size: 50,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(result?.files[index].name ?? '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    )),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          );
                                          
                                        }, separatorBuilder: (BuildContext context, int index) { 
                                          return const SizedBox(height: 5,);
                                        },)
                                  ],
                                ),
                              ):
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    
                                    SizedBox(height: 10,),
                                    Center(
                                      child: Text("No File Selected",
                                          style: TextStyle(
                                              fontSize: 13, fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                            
                          ]
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              result = await FilePicker.platform.pickFiles();
                              if (result != null) {
                                if (!kIsWeb) {
                                  file = File(result!.files.single.path!);
                                }
                                setState(() {});
                              } else {
                                print("No file selected");
                              }
                            } catch (_) {}
                          },
                          child: const Text('Upload File'),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            bool result = await _permissionRequest();
                            if (result) {
                              showDialog(
                                  context: context,
                                  builder: (dialogcontext) {
                                    return DownloadProgressDialog();
                                  });
                            } else {
                              print("No permission to read and write.");
                            }
                          },
                          child: const Text('Download File'),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              result = await FilePicker.platform.pickFiles();
                              if (result != null) {
                                if (!kIsWeb) {
                                  file = File(result!.files.single.path!);
                                }
                                setState(() {});
                              } else {
                                print("No file selected");
                              }
                            } catch (_) {}
                          },
                          child: const Text('Preview File'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              result = await FilePicker.platform.pickFiles();
                              if (result != null) {
                                if (!kIsWeb) {
                                  file = File(result!.files.single.path!);
                                }
                                setState(() {});
                              } else {
                                print("No file selected");
                              }
                            } catch (_) {}
                          },
                          child: const Text('Upload file to server'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),

    );
  }

  static Future<bool> _permissionRequest() async {
    PermissionStatus result;
    result = await Permission.storage.request();
    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }
 
}
