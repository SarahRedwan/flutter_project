import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Technology', 'count': 245, 'icon': Icons.computer, 'color': Colors.blue},
    {'name': 'Sports', 'count': 189, 'icon': Icons.sports_soccer, 'color': Colors.green},
    {'name': 'Business', 'count': 321, 'icon': Icons.business_center, 'color': Colors.orange},
    {'name': 'Health', 'count': 156, 'icon': Icons.health_and_safety, 'color': Colors.red},
    {'name': 'Entertainment', 'count': 278, 'icon': Icons.movie, 'color': Colors.purple},
    {'name': 'World News', 'count': 412, 'icon': Icons.public, 'color': Colors.teal},
    {'name': 'Science', 'count': 134, 'icon': Icons.science, 'color': Colors.indigo},
    {'name': 'Environment', 'count': 98, 'icon': Icons.eco, 'color': Colors.brown},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: category['color'],
                    child: Icon(category['icon'], color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(category['name'],
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('${category['count']} articles',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ),
          );
        },
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Highlight "Categories"
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/');
          if (index == 2) Navigator.pushNamed(context, '/about');
        },
      ),
    );
  }
}
