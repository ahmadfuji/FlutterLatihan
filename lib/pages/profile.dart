import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String name;

  Profile({required this.name});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
            print('Back to previous page');
          },
        ),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                'https://www.stickitup.xyz/cdn/shop/products/197cbocBWbR0DqF8bVNLyA-4v94G47DJn.jpg?v=1684983183&width=600',
                ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 16,
            ),
            )),
          ],
        ),
      ),
    );
  }
}