import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/auth/models/user.dart';
import 'package:keybox/constants.dart';
import 'package:keybox/home/cards/course_card.dart';
import 'package:keybox/home/cards/trainer_card.dart';
import 'package:keybox/home/models/course.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final List<User?> trainers =
        users.where((e) => e.role == 'Trainer').toList();

    print(trainers);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Découvrir nos ',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  TextSpan(
                    text: 'Formateurs',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: green,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 160,
            child: ListView.builder(
                itemCount: trainers.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, i) => i == 0
                    ? Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TrainerCard(user: trainers[i]),
                      )
                    : TrainerCard(user: trainers[i])),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Découvrir nos ',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          )),
                      TextSpan(
                        text: 'Cours',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: green,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'voir plus',
                  style: GoogleFonts.poppins(
                      color: blue, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) => GestureDetector(
              child: CourseCard(course: courses[index]),
              onTap: () => Navigator.pushNamed(context, '/homeCoursesDetails',
                  arguments: {'course': courses[index]}),
            ),
          ),
        ],
      ),
    );
  }
}
