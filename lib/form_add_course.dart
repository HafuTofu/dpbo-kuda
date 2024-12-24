import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'materials.dart';
import '../controller/sqlite.dart';
import '../controller/course.dart';

enum CourseType { offline, online }

class AddCourseForm extends StatefulWidget {
  const AddCourseForm({super.key});

  @override
  _AddCourseFormState createState() => _AddCourseFormState();
}

class _AddCourseFormState extends State<AddCourseForm> {
  final _formKey = GlobalKey<FormState>();
  final coursename = TextEditingController();
  final coursecategory = TextEditingController();
  final coursedesc = TextEditingController();
  final courseemail = TextEditingController();
  final coursephone = TextEditingController();
  final coursecapacity = TextEditingController();

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  CourseType? _character = CourseType.offline;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Materials().header(const Color(0xFF808080), 'ADD COURSE FORM'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: coursename,
                  decoration: const InputDecoration(
                    labelText: 'Course name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Course Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: coursecategory,
                  decoration: const InputDecoration(
                    labelText: 'Course Category',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Course Category';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: coursedesc,
                  decoration: const InputDecoration(
                    labelText: 'Course Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Course Description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: courseemail,
                  decoration: const InputDecoration(
                    labelText: 'Course Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Course Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: coursephone,
                  decoration: const InputDecoration(
                    labelText: 'Course Phone',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Course Phone';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  controller: coursecapacity,
                  decoration: const InputDecoration(
                    labelText: 'Course Capacity',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Course Capacity';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  "Course Type",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  title: const Text('Offline'),
                  leading: Radio<CourseType>(
                    value: CourseType.offline,
                    groupValue: _character,
                    onChanged: (CourseType? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Online'),
                  leading: Radio<CourseType>(
                    value: CourseType.online,
                    groupValue: _character,
                    onChanged: (CourseType? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      final int? capacity =
                      int.tryParse(coursecapacity.text.trim());

                      if (capacity == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Invalid course capacity')),
                        );
                        return;
                      }

                      final courseType = _character == CourseType.offline
                          ? 'Offline'
                          : 'Online';

                      final course = Course(
                        coursename.text,
                        coursecategory.text,
                        coursedesc.text,
                        courseemail.text,
                        coursephone.text,
                        courseType,
                        capacity,
                      );

                      int result =
                      await _databaseHelper.registerCourse(course);
                      if (result > 0) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Failed to add course')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF808080),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Add Course'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF575757),
                  ),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
