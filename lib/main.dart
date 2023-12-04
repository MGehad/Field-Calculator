import 'package:flutter/material.dart';
import 'Pages/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
          useMaterial3: true,
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.indigo, onPrimary: Colors.white,
            secondary: Colors.transparent, onSecondary: Colors.transparent,
            error: Colors.red, onError: Colors.red,
            background: Colors.white, onBackground: Colors.grey.shade700,
            surface: Colors.indigo, onSurface: Colors.indigo.shade700),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade300),
          )
        )
      ),
    );
  }

}