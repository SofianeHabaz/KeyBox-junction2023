import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keybox/constants.dart';
import 'package:keybox/auth/login.dart';
import 'package:keybox/auth/signup.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keybox/courses/chatbot.dart';
import 'package:keybox/courses/course_details.dart';
import 'package:keybox/courses/courses.dart';
import 'package:keybox/calender/calender.dart';
import 'package:keybox/home/Home.dart';
import 'package:keybox/home/course_details.dart';
import 'package:keybox/home/trainer_details.dart';
import 'package:keybox/profile/profile.dart';
import 'package:keybox/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KeyBox',
        home: const HomePage(),
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        supportedLocales: [const Locale('en'), const Locale('fr')],
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/trainerDetails': (context) => TrainerDetails(),
          '/courseDetails': (context) => CourseDetails(),
          '/chatbot': (context) => ChatBot(),
          '/homeCoursesDetails': (context) => HomeCourseDetails(),
        },
        theme: ThemeData().copyWith(
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: blue, secondary: green),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> widgetList = [Home(), Courses(), Calender(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: blue,
        toolbarHeight: 64,
        elevation: 0,
        title: Text(
          'KEYBOX',
          style: GoogleFonts.magra(
              fontSize: 24, fontWeight: FontWeight.bold, color: blue),
        ),
        actions: [
          _currentIndex == 3
              ? Icon(
                  Icons.edit,
                  color: blue,
                )
              : Row(
                  children: [
                    Icon(Icons.leaderboard),
                    SizedBox(
                      width: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Icon(
                        Icons.forum,
                        color: blue,
                      ),
                    ),
                  ],
                ),
          SizedBox(
            width: 24,
          ),
        ],
      ),
      body: widgetList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: green,
        unselectedItemColor: Color(0xffa5a5a5),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Acceuil',
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? green : Color(0xffa5a5a5),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Mes cours',
            icon: Icon(
              Icons.folder,
              color: _currentIndex == 1 ? green : Color(0xffa5a5a5),
            ),
          ),
          BottomNavigationBarItem(
            label: 'calendrier',
            icon: Icon(
              Icons.calendar_month,
              color: _currentIndex == 2 ? green : Color(0xffa5a5a5),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person,
                color: _currentIndex == 3 ? green : Color(0xffa5a5a5)),
          ),
        ],
      ),
    );
  }
}
