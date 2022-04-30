import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage(this.imagePath,{Key? key}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Photo",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ]
      ),
    );
  }
}
