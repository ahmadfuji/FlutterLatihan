import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:main/pages/profile.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  final globalKey = GlobalKey<ScaffoldMessengerState>();
  TextEditingController nameController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: Container(
        padding: EdgeInsets.only(
          top: 64,
          bottom: 64,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child : Center(
              child: Text(
                'EDIT PROFILE',
                style: TextStyle(fontSize: 40, color: Colors.blueAccent),
              ),
              ),
              ),
            Container(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),),
            Container(
              height: 48,
              color: Colors.blueAccent,
              child: TextButton(
                child: Text(
                  'Update',
                  style: TextStyle(
                    color: Color.fromARGB(255, 247, 244, 244),
                  fontSize: 14,
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(24),),),
                ),
                onPressed: () {
                  if(nameController.text == ''){
                    //showToast("Please Input you name");
                    //showSnackBar('Please Input you name');
                    showAlertDialogMaterial('Please input your name');
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(
                          name: nameController.text,),
                      ),
                    );
                  }
                },
              ),
              ),
          ],
        ),
      ),
    );
  }
  showToast(text){
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.5),
      textColor: Colors.white,
      fontSize: 16.0);
  }
  showSnackBar(text){
    final snackBar = SnackBar(
      content: Text(text), 
      action: SnackBarAction(
        label: 'Undo', onPressed: (){
          print('Clicked Undo!');
        },
      ),
    );
   globalKey.currentState!.showSnackBar(snackBar);
  }

  showAlertDialogMaterial(text){
    showDialog(
      context: globalKey.currentContext!,
      builder: (_) => AlertDialog(
        title: Text('Info'),
        content: Text(text),
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: (){
              Navigator.pop(globalKey.currentContext!);
              print('Clicked No!');
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: (){
              print('Clicked Yes!');
            },
          ),
        ],
        elevation: 4,
        backgroundColor: Colors.white,
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: false,
    );
  }
}