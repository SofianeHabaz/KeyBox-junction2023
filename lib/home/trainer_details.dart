import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/auth/models/user.dart';
import 'package:keybox/constants.dart';

class TrainerDetails extends StatelessWidget {
  const TrainerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final User trainer = arguments['trainer'];
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
        child: Column(
          children: [
            Image.asset('assets/trainer.png'),
            SizedBox(
              height: 20,
            ),
            Text(trainer.fullName),
          ],
        ),
      ),
    );
  }
}
