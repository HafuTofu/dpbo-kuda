import 'package:flutter/material.dart';
import '../controller/sqlite.dart';
import '../controller/course.dart';
import '../controller/enrollment.dart';
import 'materials.dart';

class CourseDetailPage extends StatefulWidget {
  final int courseId; // Pass the course ID to fetch details from the database
  final int userId; // Pass the user ID to check enrollment status
  final Color color;

  const CourseDetailPage({super.key, required this.courseId, required this.userId, required this.color});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  Course? _course;
  bool _isLoading = true;
  bool _isEnrolled = false;

  @override
  void initState() {
    super.initState();
    _fetchCourseDetails();
    _checkEnrollmentStatus();
  }

  Future<void> _fetchCourseDetails() async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'course',
      where: 'id_course = ?',
      whereArgs: [widget.courseId],
    );

    if (result.isNotEmpty) {
      setState(() {
        _course = Course.fromMap(result.first);
        _isLoading = false;
      });
    }
  }

  Future<void> _checkEnrollmentStatus() async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'enrollment',
      where: 'id_course = ? AND id_user = ?',
      whereArgs: [widget.courseId, widget.userId],
    );

    setState(() {
      _isEnrolled = result.isNotEmpty;
    });
  }

  Future<void> _enrollInCourse() async {
    if (_course == null) return;

    final enrollment = Enrollment(widget.courseId, widget.userId);
    try {
      await _dbHelper.enrollmentCourse(enrollment, _course!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully enrolled!')),
      );
      _checkEnrollmentStatus();
      _fetchCourseDetails();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to enroll: $e')),
      );
    }
  }

  Future<void> _unenrollFromCourse() async {
    if (_course == null) return;

    final enrollment = Enrollment(widget.courseId, widget.userId);
    try {
      await _dbHelper.unenrollmentCourse(enrollment, _course!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully unenrolled!')),
      );
      _checkEnrollmentStatus(); // Refresh enrollment status
      _fetchCourseDetails(); // Refresh course details
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to unenroll: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Materials().header(widget.color, 'DETAIL KURSUS'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _course == null
          ? const Center(child: Text('Course not found'))
          : Column(
        children: [
          // Top Image Section
          Image.asset(
            'images/image.jpg', // Replace with your image asset path
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
                      _course!.coursename,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _course!.coursecategory,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _course!.coursetype,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Participants: ${_course!.courseparticipants}/${_course!.coursecapacity}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
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
                      _course!.coursedesc,
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
                          Text('Phone: ${_course!.coursephone}'),
                          Text('Email: ${_course!.coursemail}'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: _isEnrolled
                          ? ElevatedButton(
                        onPressed: _unenrollFromCourse,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 16,
                          ),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'Unenroll',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                          : ElevatedButton(
                        onPressed: _enrollInCourse,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 16,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                        child: const Text(
                          'Enroll',
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