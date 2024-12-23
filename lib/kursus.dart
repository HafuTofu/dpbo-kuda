import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "English Course",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "10 materi",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            buildSection("Introduction", [
              buildLessonCard(Icons.location_on, "lorem ipsum dolor sit amet", "hours and minutes"),
              buildLessonCard(Icons.location_on, "lorem ipsum dolor sit amet", "hours and minutes"),
              buildLessonCard(Icons.wifi, "lorem ipsum dolor sit amet", "hours and minutes"),
            ]),
            SizedBox(height: 16),

            buildSection("Beginner", [
              buildLessonCard(Icons.wifi, "lorem ipsum dolor sit amet", "hours and minutes"),
              buildLessonCard(Icons.location_on, "lorem ipsum dolor sit amet", "hours and minutes"),
              buildLessonCard(Icons.location_on, "lorem ipsum dolor sit amet", "hours and minutes"),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Widget> lessons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Column(children: lessons),
      ],
    );
  }

  Widget buildLessonCard(IconData icon, String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.blue),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      ),
    );
  }
}
