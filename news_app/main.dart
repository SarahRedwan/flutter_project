import 'package:flutter/material.dart';
import 'home_page.dart';
import 'detail_page.dart';
import 'categories_page.dart';
import 'about_page.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage(),
      routes: {
        '/detail': (context) => DetailPage(),
        '/categories': (context) => CategoriesPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
