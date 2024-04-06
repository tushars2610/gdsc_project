import 'package:flutter/material.dart';
import 'package:gdsc_app/camera/phone_camera.dart';
import 'package:gdsc_app/chatbot/chatbot.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gdsc_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    const Home(),
    const CameraPage(),
     ChatPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(225, 65, 186, 0),
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(225, 65, 186, 0)),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          onTap: _navigateBottomBar,
          animationDuration: const Duration(milliseconds: 400),
          color: Colors.white,
          backgroundColor: const Color.fromARGB(225, 65, 186, 0),
          buttonBackgroundColor: const Color.fromARGB(0, 65, 186, 0),
          items: const [
            Icon(Icons.home),
            Icon(Icons.camera),
            Icon(Icons.message),
          ],
        ),
      ),
    );
  }
}
