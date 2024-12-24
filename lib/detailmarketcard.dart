import 'package:flutter/material.dart';
import '../controller/sqlite.dart';
import '../controller/market.dart';
import '../controller/marketsave.dart';
import 'materials.dart';

class MarketDetailPage extends StatefulWidget {
  final int marketId; // Pass the market ID to fetch details from the database
  final int userId; // Pass the user ID to check save status
  final Color color;

  const MarketDetailPage({super.key, required this.marketId, required this.userId, required this.color});

  @override
  State<MarketDetailPage> createState() => _MarketDetailPageState();
}

class _MarketDetailPageState extends State<MarketDetailPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  Market? _market;
  bool _isLoading = true;
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    _fetchMarketDetails();
    _checkSaveStatus();
  }

  Future<void> _fetchMarketDetails() async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'market',
      where: 'id_market = ?',
      whereArgs: [widget.marketId],
    );

    if (result.isNotEmpty) {
      setState(() {
        _market = Market.fromMap(result.first);
        _isLoading = false;
      });
    }
  }

  Future<void> _checkSaveStatus() async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'market_save',
      where: 'id_market = ? AND id_user = ?',
      whereArgs: [widget.marketId, widget.userId],
    );

    setState(() {
      _isSaved = result.isNotEmpty;
    });
  }

  Future<void> _saveMarket() async {
    if (_market == null) return;

    final db = await _dbHelper.database;

    // Check if the record already exists
    final existing = await db.query(
      'market_save',
      where: 'id_market = ? AND id_user = ?',
      whereArgs: [widget.marketId, widget.userId],
    );

    if (existing.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Market is already saved!')),
      );
      return;
    }

    final marketSave = MarketSave(widget.marketId, widget.userId);
    try {
      await _dbHelper.marketSave(marketSave);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Market saved successfully!')),
      );
      await _checkSaveStatus(); // Refresh save status
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save market: $e')),
      );
    }
  }

  Future<void> _unsaveMarket() async {
    if (_market == null) return;

    final marketSave = MarketSave(widget.marketId, widget.userId);
    try {
      await _dbHelper.marketUnsave(marketSave);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Market unsaved successfully!')),
      );
      await _checkSaveStatus(); // Refresh save status
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to unsave market: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Materials().header(widget.color, 'DETAIL MARKET'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _market == null
          ? const Center(child: Text('Market not found'))
          : Column(
        children: [
          // Top Image Section
          Image.asset(
            'images/pict-toko.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Content Section
          Expanded(
            child: Container(
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _market!.marketname,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _market!.marketype,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _market!.marketdesc,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contact',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text('Phone: ${_market!.marketphone}'),
                          Text('Email: ${_market!.marketmail}'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: _isSaved
                          ? ElevatedButton(
                        onPressed: _unsaveMarket,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 16,
                          ),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'Unsave',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                          : ElevatedButton(
                        onPressed: _saveMarket,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 16,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
