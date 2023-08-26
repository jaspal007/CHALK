import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:list_view/reminder_list.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[50],
          foregroundColor: Colors.indigo[900],
          centerTitle: true,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.indigo[900],
          selectedItemColor: Colors.blue[50],
          selectedIconTheme: const IconThemeData(size: 30),
          showSelectedLabels: true,
          unselectedIconTheme: const IconThemeData(size: 30),
          type: BottomNavigationBarType.fixed,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo[900],
          foregroundColor: Colors.blue[50],
          splashColor: Colors.blue[50],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.indigo[900],
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: const ButtonStyle().copyWith(
            foregroundColor: const MaterialStatePropertyAll(Colors.black),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        centered: true,
        splashIconSize: 500,
        splashTransition: SplashTransition.fadeTransition,
        curve: Curves.decelerate,
        splash: Center(
          child: Text(
            'CHALK',
            style: const TextStyle().copyWith(
              color: Colors.indigo[900],
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 500),
        nextScreen: const ShowList(),
      ),
    );
  }
}
