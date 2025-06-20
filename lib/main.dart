import 'dart:io';

import 'package:auvnet_internship_assessment/core/constants/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'core/di/di.dart';
import 'core/hive/hive_service.dart';
import 'core/routes/app_router.dart';
import 'core/constants/app_colors.dart';
import 'core/routes/route_generator.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDbFdKlabQ2iwB9HB8JyEkTKxa3bna9ci4",
          appId: "com.example.auvnet_internship_assessment",
          messagingSenderId: "601863882725",
          projectId: "flutter-internship-task-f9972")
  )
      :
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  configureDependencies();
   await HiveService.init();
  await Hive.openBox(AppStrings.settings);


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.nawel,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
      ),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashScreenRoute,
    );
  }
}

