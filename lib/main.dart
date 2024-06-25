

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalheathstartup/phone_auth.dart';
import 'package:mentalheathstartup/screens/home_page.dart';
import 'package:mentalheathstartup/screens/login_page.dart';
import 'package:mentalheathstartup/theme_notifier.dart';
import 'package:mentalheathstartup/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
     ChangeNotifierProvider(
      create: (_) => ThemeNotifier(), 
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return GetMaterialApp(
      title: 'Mental Health App',
      theme: themeNotifier.getTheme(),
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
