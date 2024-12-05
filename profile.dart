import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage("https://via.placeholder.com/150"), // Replace with your image URL
                    ),
                    SizedBox(height: 8),
                    Text(
                      "nama profil",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildTextField("nama panjang", "nama panjang"),
              buildTextField("tanggal lahir", "dd/mm/yy"),
              buildTextField("gender", "male/female"),
              buildTextField("kota", "kota"),
              buildTextField("kode pos", "kode pos"),
              buildTextField("nomor HP", "nomor HP"),
              buildTextField("email", "email"),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.logout),
                  label: Text("log out"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  Widget buildTextField(String labelText, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
