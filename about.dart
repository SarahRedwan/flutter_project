import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo and App Name
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text('DN',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            SizedBox(height: 16),
            Text('Daily News',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text('Your trusted source for breaking news and updates',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 6),
            Text('Version 1.0.0',
                style: TextStyle(fontSize: 12, color: Colors.grey[500])),

            SizedBox(height: 24),

            // About Description
            Align(
              alignment: Alignment.centerLeft,
              child: Text('About Daily News',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 12),
            Text(
              'Daily News is your go-to mobile application for staying informed about the latest happenings around the world. '
              'We deliver breaking news, in-depth analysis, and compelling stories across multiple categories.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 12),
            Text(
              'Our mission is to provide accurate, timely, and engaging news content that keeps you connected to the world around you.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Highlight "About"
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/');
          if (index == 1) Navigator.pushNamed(context, '/categories');
        },
      ),
    );
  }
}
