import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/auth/models/user.dart';
import 'package:keybox/constants.dart';
import 'package:keybox/home/cards/course_card.dart';
import 'package:keybox/home/models/course.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final User user = users[1];

  @override
  Widget build(BuildContext context) {
    print(user);
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 24, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Mes cours',
              style: GoogleFonts.poppins(
                  color: blue, fontSize: 32, fontWeight: FontWeight.w700),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: user.courses!.length,
            itemBuilder: (context, index) => GestureDetector(
              child: CourseCard(course: user.courses![index]),
              onTap: () => Navigator.pushNamed(context, '/courseDetails',
                  arguments: {'course': user.courses![index]}),
            ),
          ),
        ],
      ),
    );
  }
}
