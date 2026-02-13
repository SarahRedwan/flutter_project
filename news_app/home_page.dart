import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ValueNotifier<String> selectedCategory =
      ValueNotifier<String>('All');

  final List<Map<String, String>> newsItems = [
    {
      'category': 'Technology',
      'title': 'Revolutionary AI Breakthrough Changes Tech Landscape Forever',
      'description':
          'Scientists announce a major advancement in artificial intelligence that could transform how we interact with technology in daily life. This breakthrough promises smarter devices, more intuitive applications, and a new era of automation that adapts to human needs.'
          'In addition to reshaping industries, experts believe this innovation will influence education, healthcare, and communication. The announcement has already sparked debates about ethics, privacy, and the role of AI in society',
      'image':
          'https://images.unsplash.com/photo-1518770660439-4636190af475?w=900',
      'time': '2 hours ago'
    },
    {
      'category': 'Sports',
      'title': 'Historic Championship Victory Changes Basketball History',
      'description':
          'Regional club secures a dramatic win, rewriting the record books and thrilling fans worldwide. The final match was filled with suspense, with players showing extraordinary skill and determination.'
          'This victory is expected to inspire a new generation of athletes and strengthen the club’s legacy. Fans celebrated across the city, marking the triumph as one of the greatest moments in sports history.',
      'image':
          'https://images.unsplash.com/photo-1762860799518-546d6f2c12b2?w=900',
      'time': '5 hours ago'
    },
    {
      'category': 'Business',
      'title': 'Global Markets Show Resilience Amid Challenges',
      'description':
          'Stock exchanges worldwide report steady growth despite economic uncertainties. Investors remain cautiously optimistic as companies adapt to shifting global dynamics.'
          'Analysts highlight that innovation, digital transformation, and sustainable practices are driving resilience. While challenges remain, the outlook suggests that businesses are finding new ways to thrive.',
      'image':
          'https://plus.unsplash.com/premium_photo-1764695120682-7f5ad99ab4ec?w=900',
      'time': '1 day ago'
    },
    {
      'category': 'Health',
      'title': 'New Breakthrough in Cancer Research',
      'description':
          'Doctors reveal promising results from clinical trials that could change treatment approaches. The new therapy shows potential in reducing side effects while improving patient outcomes.'
          'Medical experts emphasize that while more research is needed, this breakthrough offers hope to millions. The findings have been welcomed by the global health community as a step forward in the fight against cancer.',
      'image':
          'https://images.unsplash.com/photo-1477332552946-cfb384aeaf1c?w=900',
      'time': '3 days ago'
    },
    {
      'category': 'Entertainment',
      'title': 'Blockbuster Movie Breaks Records Worldwide',
      'description':
          'The latest release has captivated audiences and shattered box office records globally. Critics praise its storytelling, visual effects, and performances that set a new benchmark in cinema.'
          'Fans across the world are flocking to theaters, making it one of the most successful films of the decade. Industry experts predict it will influence future productions and redefine audience expectations.',
      'image':
          'https://plus.unsplash.com/premium_photo-1710409625244-e9ed7e98f67b?w=900',
      'time': '6 hours ago'
    },
  ];

  final List<String> categories = [
    'All',
    'Technology',
    'Sports',
    'Business',
    'Health',
    'Entertainment'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily News'),
            Text('Stay informed, stay ahead',
                style: TextStyle(fontSize: 14, color: Colors.purple)),
          ],
        ),
      ),
      body: Column(
        children: [
          // Categories
          SizedBox(
            height: 50,
            child: ValueListenableBuilder<String>(
              valueListenable: selectedCategory,
              builder: (context, value, _) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ChoiceChip(
                        label: Text(cat),
                        selected: value == cat,
                        selectedColor: Colors.purple,
                        onSelected: (_) =>
                            selectedCategory.value = cat,
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // News list
          Expanded(
            child: ValueListenableBuilder<String>(
              valueListenable: selectedCategory,
              builder: (context, value, _) {
                final filtered = value == 'All'
                    ? newsItems
                    : newsItems
                        .where((n) => n['category'] == value)
                        .toList();

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: item,
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              item['image']!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${item['category']} • ${item['time']}',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(item['title']!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight:
                                              FontWeight.bold)),
                                  const SizedBox(height: 6),
                                  Text(
                                    item['description']!,
                                   maxLines: 3, 
                                   overflow: TextOverflow.ellipsis,
                                   style: const TextStyle(fontSize: 14),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info), label: 'About'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/categories');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/about');
          }
        },
      ),
    );
  }
}
