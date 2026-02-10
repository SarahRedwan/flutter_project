import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Detail')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category label
            Text('Technology',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple)),

            SizedBox(height: 6),

            // Timestamp and read time
            Text('2 hours ago • 5 min read',
                style: TextStyle(fontSize: 12, color: Colors.grey[600])),

            SizedBox(height: 16),

            // Headline
            Text(
              'Revolutionary AI Breakthrough Changes Tech Landscape Forever',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            // Article image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://images.unsplash.com/photo-1518770660439-4636190af475?w=900',
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20),

            // Summary paragraph
            Text(
              'Scientists announce major advancement in artificial intelligence that could transform how we interact with technology in daily life.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            SizedBox(height: 20),

            // Full article preview
            Text(
              'In a groundbreaking announcement that has sent shockwaves through the technology industry, '
              'researchers at leading institutions unveiled a new AI model capable of understanding context, emotion, and nuance in human communication. '
              'This breakthrough could revolutionize everything from virtual assistants to medical diagnostics, and marks a major leap forward in machine learning capabilities. '
              'Experts believe this innovation will reshape industries and daily life, making technology more intuitive and responsive than ever before.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
