import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';

  final List<Map<String, String>> newsItems = [
    {
      'category': 'Technology',
      'title': 'Revolutionary AI Breakthrough Changes Tech Landscape Forever',
      'description': 'Scientists announce a major advancement in artificial intelligence that could transform how we interact with technology in daily life. '
          'This breakthrough promises smarter devices, more intuitive applications, and a new era of automation that adapts to human needs.\n\n'
          'In addition to reshaping industries, experts believe this innovation will influence education, healthcare, and communication. '
          'The announcement has already sparked debates about ethics, privacy, and the role of AI in society.',
      'image': 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=900',
      'time': '2 hours ago'
    },
    {
      'category': 'Sports',
      'title': 'Historic Championship Victory Changes Basketball History',
      'description': 'Regional club secures a dramatic win, rewriting the record books and thrilling fans worldwide. '
          'The final match was filled with suspense, with players showing extraordinary skill and determination.\n\n'
          'This victory is expected to inspire a new generation of athletes and strengthen the club’s legacy. '
          'Fans celebrated across the city, marking the triumph as one of the greatest moments in sports history.',
      'image': 'https://images.unsplash.com/photo-1762860799518-546d6f2c12b2?w=900',
      'time': '5 hours ago'
      },
    {
      'category': 'Business',
      'title': 'Global Markets Show Resilience Amid Challenges',
      'description': 'Stock exchanges worldwide report steady growth despite economic uncertainties. '
          'Investors remain cautiously optimistic as companies adapt to shifting global dynamics.\n\n'
          'Analysts highlight that innovation, digital transformation, and sustainable practices are driving resilience. '
          'While challenges remain, the outlook suggests that businesses are finding new ways to thrive.',
      'image': 'https://plus.unsplash.com/premium_photo-1764695120682-7f5ad99ab4ec?w=900',
      'time': '1 day ago'
    },
    {
      'category': 'Health',
      'title': 'New Breakthrough in Cancer Research',
      'description': 'Doctors reveal promising results from clinical trials that could change treatment approaches. '
          'The new therapy shows potential in reducing side effects while improving patient outcomes.\n\n'
          'Medical experts emphasize that while more research is needed, this breakthrough offers hope to millions. '
          'The findings have been welcomed by the global health community as a step forward in the fight against cancer.',
      'image': 'https://images.unsplash.com/photo-1477332552946-cfb384aeaf1c?w=900',
      'time': '3 days ago'
    },
    {
      'category': 'Entertainment',
      'title': 'Blockbuster Movie Breaks Records Worldwide',
      'description': 'The latest release has captivated audiences and shattered box office records globally. '
          'Critics praise its storytelling, visual effects, and performances that set a new benchmark in cinema.\n\n'
          'Fans across the world are flocking to theaters, making it one of the most successful films of the decade. '
          'Industry experts predict it will influence future productions and redefine audience expectations.',
      'image': 'https://plus.unsplash.com/premium_photo-1710409625244-e9ed7e98f67b?w=900',
      'time': '6 hours ago'
    },
  ];

  final List<String> categories = ['All', 'Technology', 'Sports', 'Business', 'Health', 'Entertainment'];

  List<Map<String, String>> get filteredNews {
    if (selectedCategory == 'All') return newsItems;
    return newsItems.where((item) => item['category'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily News', style: TextStyle(fontSize: 22)),
            Text('Stay informed, stay ahead',
                style: TextStyle(fontSize: 14, color: Colors.purple)),
          ],
        ),
      ),
      body: Column(
        children: [
          // Category Tabs
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ChoiceChip(
                    label: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    selectedColor: Colors.purple,
                    backgroundColor: Colors.white,
                  ),
                );
              },
            ),
          ),

          // News Feed with Detailed Descriptions
          Expanded(
            child: ListView.builder(
              itemCount: filteredNews.length,
              itemBuilder: (context, index) {
                final item = filteredNews[index];
                return InkWell(
                  onTap: () => Navigator.pushNamed(context, '/detail'),
                  child: Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(item['image']!, fit: BoxFit.cover, width: double.infinity, height: 200),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${item['category']} • ${item['time']}',
                                  style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                              SizedBox(height: 6),
                              Text(item['title']!,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 6),
                              Text(item['description']!,
                                  style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.4)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        onTap: (index) {
          if (index == 1) Navigator.pushNamed(context, '/categories');
          if (index == 2) Navigator.pushNamed(context, '/about');
        },
      ),
    );
  }
}
