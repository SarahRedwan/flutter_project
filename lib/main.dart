import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'This is my first Flutter app',
          style: TextStyle(
            fontSize: 20, // Changed text size
            color: Colors.red, // Changed text color
          ),
        ),
      ),
    );
  }
}