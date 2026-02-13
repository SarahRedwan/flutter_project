import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> item =
        ModalRoute.of(context)!.settings.arguments
            as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: const Text('News Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item['category']!,
                style: const TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(item['time']!,
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            Text(item['title']!,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Image.network(item['image']!),
            const SizedBox(height: 20),
            Text(item['description']!,
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
