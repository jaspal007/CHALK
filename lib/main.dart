import 'package:flutter/material.dart';
import 'package:list_view/show_list.dart';

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
          backgroundColor: Colors.indigo[900],
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
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(
              Colors.indigo[900],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const ShowList(),
    );
  }
}
