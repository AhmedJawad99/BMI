import 'package:bmi/home.dart';
import 'package:bmi/results.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Body Mass Index',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.teal,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            labelMedium: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            labelLarge: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 90),
        ),
        home: const MyHomePage(
          title: 'Body Mass Index',
        ));
  }
}
