import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/auth/models/user.dart';
import 'package:keybox/constants.dart';
import 'package:keybox/home/models/course.dart';

class TrainerCard extends StatelessWidget {
  final User? user;
  const TrainerCard({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            'assets/trainers/${user!.fullName}.jpg',
          ),
          radius: 45,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 120,
          child: Flexible(
            child: Text(
              user!.fullName,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: blue, fontSize: 14, fontWeight: FontWeight.w500),
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}


/*
margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      width: 160,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black26,
            blurRadius: 0.2,
            spreadRadius: 0.8,
            blurStyle: BlurStyle.outer)
      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),


 */