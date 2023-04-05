

import 'package:flutter/material.dart';
import 'package:untitled/Register.dart';
import 'package:untitled/cleaningRegister.dart';
import 'package:untitled/homePage.dart';
import 'package:untitled/login.dart';
import 'package:untitled/porfile.dart';
import 'package:untitled/roomDetails.dart';
import 'package:untitled/scanQR.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'homePage',
    routes: {
      'homePage':(context)=>homePage(),
      'login':(context)=>Mylogin(),
      'register': (context)=>MyRegister(),
      'roomDetails': (context)=>roomDetails(),
      'cleaningRegister': (context)=>cleaningRegister(),
      'ScanQR': (context)=>ScanQR(),
      'profile': (context)=>profile()
    },
  ));
}
