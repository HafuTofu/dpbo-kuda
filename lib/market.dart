import 'package:flutter/material.dart';
import '../controller/sqlite.dart';
import 'materials.dart';
import 'detailmarketcard.dart';

class MarketList extends StatelessWidget {
  final int userId;
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  MarketList({super.key, required this.userId});

  Future<List<Map<String, dynamic>>> fetchMarketData() async {
    return await _databaseHelper.getMarketMapList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MarketDetailPage(
                            userId: userId,
                            marketId: market['id_market'] ?? 0, // Default to 0 if null
                            color: Color(0xFF9c9c9c),
                          ),
                        ),
                      );
                    },child: Materials().marketcard("images/pict-toko.png", market));
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
