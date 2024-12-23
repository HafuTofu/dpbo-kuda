import 'package:flutter/material.dart';
import 'materials.dart';

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
              const SizedBox(height: 16),
              buildTextField("nama panjang", "nama panjang"),
              buildTextField("email", "email"),
              const Center(
                child: Column(
                  children: [
                    Text(
                      "statistik",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                ],)
              ),
                          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 10),
                    appslider(),
                    const SizedBox(height: 20),

                    const SizedBox(height: 10),
                    appslider2(),
                    const SizedBox(height: 20),
                  ]),
            ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout),
                  label: const Text("log out"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
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
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

  Container appslider() {
    Container container = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      height: 130,
      child: ListView.separated(
          itemCount: 1,
          separatorBuilder: (context, index) => const SizedBox(
                width: 12,
              ),
          itemBuilder: (context, index) {
            return GestureDetector(

              child:  SizedBox(
              height: 130,
              child: Materials().marketcard2('images/pict-toko.png'),
            ),
            );
          }),
    );
    return container;
  }

    Container appslider2() {
    Container container = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      height: 130,
      child: ListView.separated(
          itemCount: 1,
          separatorBuilder: (context, index) => const SizedBox(
                width: 12,
              ),
          itemBuilder: (context, index) {
            return GestureDetector(

              child:  SizedBox(
              height: 130,
              child: Materials().marketcard3('images/pict-toko.png'),
            ),
            );
          }),
    );
    return container;
  }
