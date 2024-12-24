import 'package:flutter/material.dart';
import '../controller/sqlite.dart'; // Replace with your actual database helper class
import 'materials.dart'; // Assuming this is your custom widget class

class MarketList extends StatelessWidget {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  MarketList({super.key});

  Future<List<Map<String, dynamic>>> fetchMarketData() async {
    // Replace with your actual database query to fetch market data
    return await _databaseHelper.getCourseMapList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Materials().header(const Color(0xFF808080), 'Market Page'),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchMarketData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          final marketData = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.2,
              ),
              itemCount: marketData.length,
              itemBuilder: (context, index) {
                final market = marketData[index];
                return MarketCard(
                  title: market['name'] ?? 'Unknown Market',
                  location: market['location'] ?? 'Unknown Location',
                  imageUrl: market['image_url'] ??
                      'https://example.com/default_image.jpg',
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MarketCard extends StatelessWidget {
  final String title;
  final String location;
  final String imageUrl;

  const MarketCard({
    required this.title,
    required this.location,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.broken_image,
                size: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              location,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
