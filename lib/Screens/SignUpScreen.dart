import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_store/Model/User.dart';
import 'package:one_store/Widgets/Costum.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors:[
                  Colors.orange.shade900,
                  Colors.orange.shade800,
                  Colors.orange.shade400,

                ]


              ),
            ),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Padding(padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Register', style: GoogleFonts.cabin(fontSize: 35, fontWeight:FontWeight.w600,letterSpacing: 1, color: Colors.white ) ),
                SizedBox(height: 10,),
                Text('Fill All the details', style: GoogleFonts.abel(fontSize: 24, fontWeight:FontWeight.w600,letterSpacing: 1, color: Colors.white ) ),

              ],
            ),
            ),

            Expanded(
              child: Container(



                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),

              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Costum.textField('First Name', firstname, Icons.person),
                    SizedBox(height: 5,),
                    Costum.textField('Last Name', lastname, Icons.person),
                    SizedBox(height: 5,),
                    Costum.textField('Email', email, Icons.mail),
                    SizedBox(height: 5,),
                    Costum.textField('Phone', phone, Icons.mobile_friendly_rounded),
                    SizedBox(height: 5,),
                    Costum.textField(
                        'Password', password, Icons.remove_red_eye_outlined),
                    SizedBox(height: 15,),
                    Costum.Button(() {
                      postData();
                      },

                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postData() async {
    final url = "https://www.infusevalue.live/api/v1/auth/register";
    UserModel userModel = UserModel(
        firstname: firstname.text.toString(),
        lastname: lastname.text.toString(),
        email: email.text.toString(),
        phone: phone.text.toString(),
        password: password.text.toString());
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userModel.toJason()));

    if (response.statusCode == 200) {
      print('Data Send Success');
      print(response.body);
    } else {
      print('Data not Send Success');
      print(response.statusCode);
    }
  }
}
