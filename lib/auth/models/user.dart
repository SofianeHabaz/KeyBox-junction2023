import 'package:keybox/home/models/course.dart';

class User {
  String id;
  String fullName;
  String? parentFullname;
  String phoneNumber;
  String email;
  String residentialAddress;
  DateTime dateOfBirth;
  String role;
  List<Course>? courses;
  User({
    required this.id,
    required this.fullName,
    this.parentFullname,
    required this.phoneNumber,
    required this.email,
    required this.residentialAddress,
    required this.dateOfBirth,
    required this.role,
    this.courses,
  });

  User copyWith({
    String? id,
    String? fullName,
    String? parentFullname,
    String? phoneNumber,
    String? email,
    String? residentialAddress,
    DateTime? dateOfBirth,
    String? role,
    List<Course>? courses,
  }) =>
      User(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        parentFullname: parentFullname ?? this.parentFullname,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        residentialAddress: residentialAddress ?? this.residentialAddress,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        role: role ?? this.role,
        courses: courses ?? this.courses,
      );
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        fullName: json['FullName'],
        parentFullname: json['parentFullname'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        residentialAddress: json['residentialAddress'],
        dateOfBirth: json['dateOfBirth'],
        role: json['role'],
        courses: json['courses'],
      );
  Map<String, dynamic> toJson() => {
        '_id': id,
        'FullName': fullName,
        'parentFullname': parentFullname,
        'phoneNumber': phoneNumber,
        'email': email,
        'residentialAddress': residentialAddress,
        'dateOfBirth': dateOfBirth,
        'role': role,
        'courses': courses,
      };
}

final List<User> users = [
  User(
      id: '1',
      fullName: 'Bilel Laib',
      phoneNumber: '0550099786',
      email: 'bilellaib@gmail.com',
      residentialAddress: 'Alger',
      dateOfBirth: DateTime(1998, 5, 18),
      role: 'Trainer'),
  User(
    id: '2',
    fullName: 'hamdouche Amine',
    phoneNumber: '0550099786',
    email: 'bamine@gmail.com',
    residentialAddress: 'Alger',
    dateOfBirth: DateTime(1998, 5, 18),
    role: 'Trainer',
    courses: courses.sublist(0, 3),
  ),
  User(
      id: '3',
      fullName: 'Celine Marriot',
      phoneNumber: '0778095482',
      email: 'mceline@gmail.com',
      residentialAddress: 'Alger',
      dateOfBirth: DateTime(1998, 5, 18),
      role: 'Trainer'),
  User(
      id: '4',
      fullName: 'Kamelia Benattalah',
      phoneNumber: '0550099786',
      email: 'bkamelia@gmail.com',
      residentialAddress: 'Alger',
      dateOfBirth: DateTime(1998, 5, 18),
      role: 'Trainer'),
  User(
      id: '6',
      fullName: 'Karim Oumache',
      phoneNumber: '0550099786',
      email: 'oumachkarim@gmail.com',
      residentialAddress: 'Alger',
      dateOfBirth: DateTime(1998, 5, 18),
      role: 'Student'),
];
