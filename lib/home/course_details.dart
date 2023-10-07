import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/auth/models/user.dart';
import 'package:keybox/constants.dart';
import 'package:keybox/courses/cards/seance_card.dart';
import 'package:keybox/courses/seance_details.dart';
import 'package:keybox/home/cards/trainer_card.dart';
import 'package:keybox/home/models/course.dart';
import 'package:keybox/home/models/seance.dart';

class HomeCourseDetails extends StatelessWidget {
  HomeCourseDetails({super.key});
  final List<User?> trainers = users.where((e) => e.role == 'Trainer').toList();
  int totalHeure(List<Seance> s) {
    return s.fold(0, (i, sc) {
      return i + int.parse(sc.duree);
    });
  }

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
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      Row(
                        children: [
                          Icon(
                            Icons.stars,
                            color: Colors.amber,
                            size: 16,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '4.8',
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          )
                        ],
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
              Text(
                'Detail du cours',
                style: GoogleFonts.poppins(
                    color: green, decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 8,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: course.contenu.length,
                  itemBuilder: (context, index) => Row(children: [
                        Text(
                          "\u2022",
                          style: TextStyle(fontSize: 30),
                        ), //bullet text
                        SizedBox(
                          width: 10,
                        ), //space between bullet and text
                        Expanded(
                            child: Text(
                          course.contenu[index].title,
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.black87),
                        )),
                      ])),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Durée: ${totalHeure(course.contenu).toString()}H',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Formateurs',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TrainerCard(user: trainers[(int.parse(course.id) - 1) % 4]),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Prix: ${course.price}',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  ElevatedButton(
                    child: Text(
                      "S'inscrire",
                      style: GoogleFonts.poppins(color: green, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1, // thickness
                              color: Color(0xff35A29F), // color
                            ),
                            // border radius
                            borderRadius: BorderRadius.circular(16)),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        fixedSize: Size(120, 40)),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
