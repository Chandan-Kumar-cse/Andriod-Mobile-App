import 'package:edupro/screens/program_list_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:edupro/screens/splash_screen.dart';
import 'package:edupro/screens/home_screen.dart';
import 'package:edupro/screens/profile_screen.dart';
import 'package:edupro/screens/edit_profile_page.dart';
import 'package:edupro/screens/notification_screen.dart';
import 'package:edupro/screens/all_category_screen.dart';
import 'package:edupro/screens/auth_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const EduProApp());
}

class EduProApp extends StatelessWidget {
  const EduProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduPro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6A5AE0),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6A5AE0)),
      ),
      home:SplashScreen(),

    );
  }
}