import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/constants.dart';
import 'package:keybox/home/models/course.dart';
import 'package:keybox/home/models/seance.dart';

class CourseCard extends StatelessWidget {
  final Course? course;
  const CourseCard({super.key, this.course});
  int totalHeure(List<Seance> s) {
    return s.fold(0, (i, sc) {
      return i + int.parse(sc.duree);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        padding: EdgeInsets.only(right: 16, top: 10, bottom: 10),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 0.2,
                  spreadRadius: 0.8,
                  blurStyle: BlurStyle.outer)
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: ListTile(
                leading: Image.asset(
                  course!.logo,
                  width: 80,
                  height: 80,
                ),
                title: Text(
                  course!.title,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  maxLines: 2,
                ),
                subtitle: Text(
                  course!.description,
                  style: GoogleFonts.poppins(fontSize: 14),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Durée: ${totalHeure(course!.contenu).toString()}H',
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
                  ),
                  Text(
                    course!.domaine,
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}



/*


Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          'assets/trainer.png',
          width: 80,
          height: 80,
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course!.title,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
              maxLines: 2,
            ),
            Text(
              course!.description,
              style: GoogleFonts.poppins(fontSize: 14),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ]),





 */
