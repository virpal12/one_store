import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
            borderSide: BorderSide(color: Colors.black, width: 1)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.purple, width: 1),
        ),
      ),
    );
  }

  static Button(void Function()? onPressed, String txt ) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(txt ,style: TextStyle(color: Colors.white, fontSize: 22),),
      style: ElevatedButton.styleFrom(minimumSize: Size(350, 50), backgroundColor: Colors.black),
    );
  }


  static snack_bar (BuildContext context , String title, message, ContentType contentType) {
    final snackBar = SnackBar(

      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
