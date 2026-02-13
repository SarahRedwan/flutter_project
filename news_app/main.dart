import 'package:flutter/material.dart';
import 'home_page.dart';
import 'detail_page.dart';
import 'categories_page.dart';
import 'about_page.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily News',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage(),
      routes: {
        '/detail': (context) => const DetailPage(),
        '/categories': (context) => CategoriesPage(),
        '/about': (context) =>  AboutPage(),
      },
    );
  }
}
