import 'package:cricket/balling1.dart';
import 'package:cricket/batting1.dart';
import 'package:flutter/material.dart';

class inning1 extends StatefulWidget {
  final date;
  //final inning;
  final match;
   inning1({super.key,required this.date,required this.match,});

  @override
  State<inning1> createState() => _inning1State(Date: date,Match: match,);
}

class _inning1State extends State<inning1> {
  final String Date;
  final String Match;
//  final String Inning;
  _inning1State({required this.Date,required this.Match,});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 30,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicatorColor: Color(0xff05fc79),
            labelColor: Color(0xff05fc79),
            indicatorWeight: 5,
            indicatorSize:TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "Batting",icon: Icon(Icons.sports_cricket,color: Colors.white,),),
              Tab(text: "Balling",icon: Icon(Icons.sports_handball_outlined,color: Colors.white,),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            batting1(date: Date, match: Match,),
            balling1(date: Date, match: Match,)
          ],
        ),
      ),
    );
  }
}
