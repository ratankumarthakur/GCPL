import 'package:cricket/balling2.dart';
import 'package:cricket/batting2.dart';
import 'package:flutter/material.dart';

class inning2 extends StatefulWidget {
  final date;
  //final inning;
  final match;
   inning2({super.key,required this.date,required this.match,});

  @override
  State<inning2> createState() => _inning2State(Date: date,Match: match,);
}

class _inning2State extends State<inning2> {
  final String Date;
  final String Match;
//  final String Inning;
  _inning2State({required this.Date,required this.Match,});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicatorColor:Color(0xff05fc79),
            labelColor: Color(0xff05fc79),
            indicatorWeight: 5,
            indicatorSize:TabBarIndicatorSize.tab,

            tabs: [
              Tab(text: "Batting",icon: Icon(Icons.sports_cricket,color: Colors.white,),),
              Tab(text: "Balling",icon: Icon(Icons.sports_handball_outlined,color: Colors.white,),),
            ],
          ),
        ),
        body:TabBarView(
          children: [
            batting2(date: Date, match: Match,),
            balling2(date: Date, match: Match)
          ],
        ),
      ),
    );
  }
}

