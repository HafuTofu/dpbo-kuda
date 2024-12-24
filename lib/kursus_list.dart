import 'package:flutter/material.dart';
import '../controller/sqlite.dart';
import 'materials.dart';
import 'detailcoursecard.dart';

class KursusList extends StatelessWidget {
  final int userId;
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  KursusList({super.key, required this.userId});

  Future<List<Map<String, dynamic>>> fetchCourseData() async {
    return await _databaseHelper.getCourseMapList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchCourseData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          final courseData = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.2,
              ),
              itemCount: courseData.length,
              itemBuilder: (context, index) {
                final course = courseData[index];
                return GestureDetector(
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailPage(
                        userId: userId,
                        courseId: course['id_course'] ?? 0, // Default to 0 if null
                        color: Color(0xFF808080),
                      ),
                    ),
                  );
                },child: Materials().coursecard("images/pict-toko.png", course));
              },
            ),
          );
        },
      ),
    );
  }
}