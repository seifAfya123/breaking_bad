import 'package:break_and_bad_v1/constants/settings.dart';
import 'package:break_and_bad_v1/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    approuter: appRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final appRouter approuter;

  const MyApp({Key? key, required this.approuter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: all_characters_Screen,
      onGenerateRoute: approuter.generateRoute,
    );
  }
}
