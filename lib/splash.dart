import 'dart:async';
import 'package:cricket/dates.dart';
import 'package:cricket/sports.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>sports()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children:[ 
              Lottie.asset('assets/sp.json',height: 300,repeat: true,),
            SizedBox(height: 40,),
            const Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Lets",style: TextStyle(color: Colors.red,fontSize: 35),),
                Text(" enjoy Garmi chutti",style: TextStyle(color: Colors.orange,fontSize: 25),),
              ],
            )])
      ),
    );
  }
}
