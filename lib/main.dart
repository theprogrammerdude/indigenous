import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indigenous_app/methods/auth_methods.dart';
import 'package:indigenous_app/pages/home_page.dart';
import 'package:indigenous_app/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final AuthMethods _authMethods = AuthMethods();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indigenous',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColor: const Color(0xFF0072b1),
        primarySwatch: Colors.blue,
      ),
      home: _authMethods.currentUser() != null ? const Home() : const Welcome(),
    );
  }
}
