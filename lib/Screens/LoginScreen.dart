import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:google_fonts/google_fonts.dart';
import 'package:one_store/Screens/Home.dart';
import 'package:one_store/Screens/splash.dart';

import 'package:one_store/Widgets/Costum.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_const.dart';
import '../constants/shared_pref_const.dart';
import 'Product Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.red.shade900,
            Colors.red.shade800,
            Colors.red.shade400,
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login',
                      style: GoogleFonts.cabin(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Welcome back...',
                      style: GoogleFonts.abel(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Colors.white)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Costum.textField('Email', email, Icons.mail),
                      SizedBox(
                        height: 15,
                      ),

                      Costum.textField(
                          'Password', password, Icons.remove_red_eye_outlined),
                      SizedBox(
                        height: 25,
                      ),
                      Costum.Button(() async {
                        LoginData(context);
                      }, 'Login'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> LoginData(BuildContext context) async {

    final response = await http.post(Uri.parse("$baseUrl$loginApi"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email.text.toString(),
          "password": password.text.toString(),
        }));

    if (response.statusCode == 200) {
      print('Data Send Success');
      print(response.body);
      Map<String,dynamic> res = jsonDecode(response.body);
      Costum.snack_bar(
          context, 'Success', 'Login Successfully', ContentType.success);
      Navigator.push(context, MaterialPageRoute(builder: (_) => Product()));
      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool(SharedPrefConst.isLogIn, true);
      sharedPref.setString(SharedPrefConst.token, res["token"]);
    } else {
      print('Data not Send Success');
      print(response.statusCode);
      Costum.snack_bar(context, "Failled", response.statusCode.toString(),
          ContentType.failure);
    }
  }
}
