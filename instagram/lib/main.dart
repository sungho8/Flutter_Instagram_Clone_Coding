import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:instagram/src/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black, backgroundColor: Colors.white),
      ),
      home: const App(),
      initialBinding: InitBinding(),
    );
  }
}
