import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


pickImage(ImageSource imageSource)async{
  final ImagePicker imagePicker = ImagePicker();

  XFile? file = await imagePicker.pickImage(source: imageSource);
  if(file != null){
    return file.readAsBytes();
  }
  print('No image selected');
}

showSnackBar(String message,BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

void push(BuildContext context, Widget screen){
  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>screen));
}

void pushReplacement(BuildContext context, Widget screen){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>screen));
}