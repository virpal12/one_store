import 'package:flutter/material.dart';

class Costum {
  static textField(
      String? text, TextEditingController? Controller, IconData? iconData) {
    return TextField(
      controller: Controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Colors.black, height: 0.5,fontWeight: FontWeight.bold, fontSize: 15,),
        prefixIcon: Icon(iconData),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black, width: 2)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white70, width: 2),
        ),
      ),
    );
  }

  static Button(void Function()? onPressed, ) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Sign Up'),
      style: ElevatedButton.styleFrom(minimumSize: Size(400, 50)),
    );
  }
}
