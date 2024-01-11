import 'package:flutter/material.dart';
class Course {
  final String title;
  final String description;
  final String iconSrc;
  final Color bgcolor;

  Course({
    required this.title,
    this.description = 'Build and animate an ios app form scratch',
    this.iconSrc = "assets/icons/ios.svg",
    this.bgcolor = const Color(0xFF7553F6),
  });
}

List<Course> courses = [
  Course(
    title: 'Animations if SwiftUI'),
    Course(
      title: 'Animations in Flutter',
      iconSrc: 'assets/icons/code.svg',
      bgcolor: const Color(0xFF80A4FF),
    ),
];
List<Course> recentCourse =[
  Course(
    title: 'State Machine'),
    Course(
      title: 'Animations in Flutter',
      iconSrc: 'assets/icons/code.svg',
      bgcolor: const Color(0Xff9CC5FF),
    ),
     Course(
    title: 'Flutter with Rive'),
    Course(
      title: 'Animatied Menu',
      iconSrc: 'assets/icons/code.svg',
      bgcolor: const Color(0Xff9CC5FF),
    ),
];