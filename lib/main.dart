

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Register.dart';
import 'package:untitled/cleaningRegister.dart';
import 'package:untitled/homePage.dart';
import 'package:untitled/login.dart';
import 'package:untitled/porfile.dart';
import 'package:untitled/roomDetails.dart';
import 'package:untitled/scanQR.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
