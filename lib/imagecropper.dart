import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class imagecroper extends StatefulWidget {
  const imagecroper({Key? key}) : super(key: key);

  @override
  State<imagecroper> createState() => _imagecroperState();
}

class _imagecroperState extends State<imagecroper> {
  File? image2;
  Future pickImage() async {
    try {
      final image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image1 == null) return;
      final imageTemp = File(image1.path);
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image1.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      setState(() => this.image2 =File(croppedFile!.path) );
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ElevatedButton(
                child: Text("Open Gallery"),onPressed: (){
                  pickImage();
              },
              ),
             image2!=null ? Image(image:Image.file(image2!).image):Container(),
            ],
          ),
        ),
      ),
    );
  }
}
