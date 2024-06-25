

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mentalheathstartup/phone_auth.dart';
import 'package:mentalheathstartup/screens/home_page.dart';
import 'package:mentalheathstartup/screens/login_page.dart';
import 'package:mentalheathstartup/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool isAuthenticated = false;
  String initialRoute = '/login';

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(), 
      child: MyApp(
        initialRoute: initialRoute,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    required this.initialRoute,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'IITK Mail-Client',
      theme: themeNotifier.getTheme(),
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const PhoneAuth(),
        '/home': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
