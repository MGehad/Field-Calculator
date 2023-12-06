import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'Pages/HistoryPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

List<HistoryCardData> historyDataList = [];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue.shade600,
          onPrimary: Colors.white,
          secondary: Colors.blue.shade500,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white,
          onBackground: Colors.grey.shade700,
          surface: Colors.white,
          onSurface: Colors.black,
          onInverseSurface: Colors.blue.shade500,
          inversePrimary: Colors.blue.shade100,
          tertiary: Colors.blue.shade300,
        ),
      ),
    );
  }
}
