import 'package:flutter/material.dart';
import 'package:liy_trials/pages/home/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liy Trials',
      home: HomePage(),
    );
  }
}
