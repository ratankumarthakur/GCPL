import 'package:cricket/cricket_stats.dart';
import 'package:cricket/dates.dart';
import 'package:cricket/splash.dart';
import 'package:cricket/sports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{                                                               //all these down below under main(){ has to be written when using firebase .
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB4LvDTZuYkdREoWQ_fq3_c9WkQvgiqz98",
          appId: "1:625025403950:android:67dd5fcf8e097473a0e3bf",
          messagingSenderId:"625025403950",
          projectId: "cricket-48b32")
  );
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garmi Chutti Premier League',
      debugShowCheckedModeBanner: false,
      home: splash()
    );
  }
}
