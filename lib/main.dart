// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:help_desk_app/Screens/register/register_screen.dart';
import 'package:help_desk_app/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore db = FirebaseFirestore.instance;
  //db.collection("usuarios").doc("001").set({"nome": "Giovanna Sousa Jimenez"});

  runApp(const HelpDeskApp());
}

class HelpDeskApp extends StatelessWidget {
  const HelpDeskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HelpDesk App',
      theme: ThemeData(
        primaryColor: AppColors.textColorBlue,
      ),
      home: const RegisterScreen(),
    );
  }
}
