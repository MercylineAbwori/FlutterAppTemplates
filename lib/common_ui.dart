import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/home.dart';
import 'package:flutter_app_template/components/pickers/file_picker/file_picker.dart';
import 'package:flutter_app_template/components/pickers/file_picker/multi_file_picker.dart';
import 'package:flutter_app_template/components/pickers/image_picker/image_picker.dart';
import 'package:flutter_app_template/components/pickers/image_picker/multi_image_picker.dart';
import 'package:flutter_app_template/components/profile.dart';
import 'package:flutter_app_template/components/settings.dart';
import 'package:flutter_app_template/shared/main_nav.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CommonUIPage extends StatefulWidget {
  const CommonUIPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CommonUIPage> createState() => _CommonUIPageState();
}

class _CommonUIPageState extends State<CommonUIPage> {
  final _controller = SideMenuController();
  int _currentIndex = 0;

  Widget? bodywidgets;

  int index = 0;


  @override
  void initState() {
    super.initState();

    bodywidgets = FilePickerPage();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: const Text("Flutter Template"), 
      ), 
      body: bodywidgets,
      drawer: Drawer( 
        child: ListView( 
          padding: EdgeInsets.zero, 
          children: [ 
            
            UserAccountsDrawerHeader(
              accountName: const Text('Oflutter.com'),
              accountEmail: const Text('example@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
                ),
              ),
            ),
            ListTile( 
              leading: const Icon(Icons.home_max), 
              title: const Text('Home '), 
              onTap: () { 
                setState((){
                  Navigator.pop(context);
                  bodywidgets = HomePage();
                });
              }, 
            ), 
            ListTile( 
              leading: const Icon(Icons.settings), 
              title: const Text('Settings'), 
              onTap: () { 
                setState(() {
                  Navigator.pop(context);
                  bodywidgets = const SettingsPage();
                });
                
              }, 
            ), 
            ListTile( 
              leading: const Icon(Icons.person), 
              title: const Text('Profile'), 
              onTap: () { 
                setState(() {
                  bodywidgets = ProfilePage();
                  Navigator.pop(context); 
                  
                });
                
              }, 
            ), 
            ExpansionTile(
              leading: const Icon(Icons.file_upload), 
              title: const Text('Pickers'),
              children: <Widget>[
                ListTile(
                  title: const Text('File Picker'),
                  onTap: () { 
                    setState(() {
                      bodywidgets = FilePickerPage();
                      Navigator.pop(context); 
                      
                    });
                    
                  }, 
                ),
                ListTile(
                  title: const Text('Image Picker'),
                  onTap: () { 
                    setState(() {
                      bodywidgets = ImagePickerPage();
                      Navigator.pop(context); 
                      
                    });
                    
                  },
                ),
                ListTile(
                  title: const Text('Multi Form Picker'),
                  onTap: () { 
                    setState(() {
                      bodywidgets = MultiFilePickerPage();
                      Navigator.pop(context); 
                      
                    });
                    
                  },
                ),
                ListTile(
                  title: const Text('Multi Form Image Picker'),
                  onTap: () { 
                    setState(() {
                      bodywidgets = MultiImagePickerPage();
                      Navigator.pop(context); 
                      
                    });
                    
                  },
                ),
              ],
            ), 
            const ExpansionTile(
              leading: Icon(Icons.file_open), 
              title: Text('Forms'),
              children: <Widget>[
                ListTile(
                  title: Text('Basic Form'),
                  
                ),
                ListTile(
                  title: Text('Download Form')
                ),
                ListTile(
                  title: Text('Edit File')
                ),
                ListTile(title: Text('Upload Form to Server')),
              ],
            ),
            // const ExpansionTile(
            //   leading: const Icon(Icons.file_open), 
            //   title: Text('File Picker'),
            //   children: <Widget>[
            //     ListTile(title: Text('Upload File')),
            //     ListTile(title: Text('Download File')),
            //     ListTile(title: Text('Change File')),
            //     ListTile(title: Text('Preview File')),
            //     ListTile(title: Text('Multi File Upload')),
            //     ListTile(title: Text('Upload File to Server')),
            //   ],
            // ),
            // const ExpansionTile(
            //   leading: const Icon(Icons.image), 
            //   title: Text('Image Picker'),
            //   children: <Widget>[
            //     ListTile(title: Text('Upload Picture From Gallery')),
            //     ListTile(title: Text('Capture From Camera')),
            //     ListTile(title: Text('Edit Picture')),
            //     ListTile(title: Text('Preview Picture')),
            //     ListTile(title: Text('Multi Pictures')),
            //     ListTile(title: Text('Upload Image to Server')),
            //   ],
            // ),
            ListTile( 
              title: Padding(
                padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: Hero(
                      tag: "login_btn",
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 40)),
                        onPressed: (){},
                        child: const Text(
                          'Log Out'
                        ),
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
