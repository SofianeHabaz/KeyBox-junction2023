import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/constants.dart';
import 'package:keybox/home/models/seance.dart';

class SeanceCard extends StatelessWidget {
  final Seance? seance;
  const SeanceCard({super.key, this.seance});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        margin: EdgeInsets.symmetric(vertical: 10),
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
                leading: Stack(alignment: Alignment.center, children: [
                  SvgPicture.asset(
                    'assets/play-icon.svg',
                    colorFilter: ColorFilter.mode(green, BlendMode.srcIn),
                    height: 38,
                    width: 38,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(seance!.id.toString(),
                        style: GoogleFonts.poppins(
                            color: green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  )
                ]),
                title: Text(
                  seance!.title,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  children: [
                    Text(
                      seance!.description,
                      style: GoogleFonts.poppins(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Durée: ${seance!.duree.toString()}H',
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
                  ),
                  Text(
                    '${seance!.date.day.toString()} - ${seance!.date.month.toString()} - ${seance!.date.year.toString()}',
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
