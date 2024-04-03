import 'dart:async';
import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:one_store/Screens/LoginScreen.dart';
import 'package:one_store/Screens/Product%20Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignUpScreen.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {

  static const KEY = 'LOGIN';
  @override
  void initState() {
    super.initState();
    whereTogo();

  }
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Text('One Store',style: GoogleFonts.allura(fontSize: 46, fontWeight: FontWeight.bold, color: Colors.black),),
            Expanded(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                alignment: Alignment.center,
                child: Lottie.asset(
                  'Assets/Image/splash-icon.json'
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text('Powered by Virpalsinh Jadeja',
                  style: GoogleFonts.niramit(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ));
  }

  void whereTogo() async {

    var sharedpref =  await SharedPreferences.getInstance();
    
   var isLoggedIn=  sharedpref.getBool(KEY);


    Timer(Duration(seconds: 4), () {
      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Product()));

        }else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));

        }
      }else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignUp()));

      }
    });



  }
}
