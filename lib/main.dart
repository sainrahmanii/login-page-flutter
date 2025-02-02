import 'package:flutter/material.dart';
// import 'package:project_flutter/card.dart';
// import 'package:project_flutter/destination.dart';
import 'package:project_flutter/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
        fontFamily: 'Clash Display',
      ),
      home: const LoginPage(),
    );
  }
}
