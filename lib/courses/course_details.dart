import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/constants.dart';
import 'package:keybox/courses/cards/seance_card.dart';
import 'package:keybox/courses/seance_details.dart';
import 'package:keybox/home/models/course.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final Course course = arguments['course'];
    /*final heure_totale = course.contenu.fold(0, (i, sc) {
      return i + int.parse(sc.duree);
    });*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: blue,
        toolbarHeight: 64,
        elevation: 0,
        title: Text(
          'KEYBOX',
          style: GoogleFonts.magra(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(fit: FlexFit.tight, child: SizedBox()),
                Container(
                  height: 30,
                  width: 100,
                  child: Center(
                      child: Text(
                    '120 points',
                    style: GoogleFonts.poppins(color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(course.logo),
                  radius: 30,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: GoogleFonts.poppins(
                          color: blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      course.domaine,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              course.description,
              style: GoogleFonts.poppins(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: course.contenu.length,
              itemBuilder: (context, index) => GestureDetector(
                child: SeanceCard(
                  seance: course.contenu[index],
                ),
                onTap: () => showDialog(
                    context: context,
                    builder: (context) => SeanceDetails(
                          seance: course.contenu[index],
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
