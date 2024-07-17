import 'package:e_commers_app/admin/add_food.dart';
import 'package:e_commers_app/admin/admin_login_screen.dart';
import 'package:e_commers_app/admin/home_admin.dart';
import 'package:e_commers_app/pages/bottom_nav_bar.dart';
import 'package:e_commers_app/pages/onboarding_screen.dart';
import 'package:e_commers_app/pages/wallet_screen.dart';
import 'package:e_commers_app/widgets/app_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD_1hFliADkL87MZh1Yn1n0Eru0CMFxhOg",
          appId: "1:1086421995553:android:152bfc069038da9c0a9360",
          messagingSenderId: "1086421995553",
          projectId: "e-commerce-app-afaa0",
          storageBucket:'e-commerce-app-afaa0.appspot.com'
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNav (),
    );
  }
}