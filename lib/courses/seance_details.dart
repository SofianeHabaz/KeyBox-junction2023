import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/constants.dart';
import 'package:keybox/home/models/seance.dart';

class SeanceDetails extends StatelessWidget {
  final Seance seance;
  const SeanceDetails({super.key, required this.seance});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 480,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Durée: ${seance.duree}H',
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${seance.date.day}-${seance.date.month}-${seance.date.year}',
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                seance.title,
                style: GoogleFonts.poppins(
                    color: blue, fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                seance.description,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Icon(
                    Icons.file_download,
                    color: green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'tétécharger le résumé du cours',
                    style: TextStyle(color: green),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                child: Text(
                  "Quizz",
                  style: GoogleFonts.poppins(),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    elevation: 0,
                    fixedSize: Size(120, 40)),
                onPressed: () {},
              ),
              SizedBox(
                height: 4,
              ),
              ElevatedButton(
                child: Text(
                  "Chatbot",
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    elevation: 0,
                    fixedSize: Size(120, 40)),
                onPressed: () => Navigator.pushNamed(context, '/chatbot'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

class SeanceDetails extends StatelessWidget {
  const SeanceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final Seance seance = arguments['seance'];
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: green, width: 1)),
              child: Center(
                child: Text(seance!.id.toString(),
                    style: GoogleFonts.poppins(
                        color: green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              width: 8,
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Durée: ${seance.duree}H',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '${seance.date.day}-${seance.date.month}-${seance.date.year}',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              seance.title,
              style: GoogleFonts.poppins(
                  color: blue, fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              seance.description,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Icon(
                  Icons.file_download,
                  color: green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'tétécharger le résumé du cours',
                  style: TextStyle(color: green),
                )
              ],
            ),
            TextButton(
              onPressed: () => null, 
              child: Text('Quizz')
              )
          ],
        ),
      ),
    );
  }
}



 */