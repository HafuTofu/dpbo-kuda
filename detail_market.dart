import 'package:flutter/material.dart';
import 'materials.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Materials().header(Colors.grey, 'DETAIL PRODUK'), 
      body: Column(
        children: [
          // Top Image Section
          Image.asset(
            'assets/apples.jpg', // replace with your image asset path
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
                    const Text(
                      'nama kursus',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'jenis kursus',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'jumlah orang ?/?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Deskripsi kursus',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'kontak narahubung',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('nomor telepon'),
                          Text('email'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 16),
                          backgroundColor: Colors.grey,
                        ),
                        child: const Text(
                          'ikuti',
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
