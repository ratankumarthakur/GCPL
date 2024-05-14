import 'package:cricket/inning1.dart';
import 'package:cricket/inning2.dart';
import 'package:flutter/material.dart';

import 'cricket_players.dart';

class third_page extends StatefulWidget {
  final date;
  final match;
  final ft;
  final st;
  //final inning;
   third_page({super.key,required this.date,required this.match,required this.ft,required this.st});

  @override
  State<third_page> createState() => _third_pageState(Date: date, Match: match,Ft: ft,St: st);
}

class _third_pageState extends State<third_page> {
  final String Date;
  final String Match;
  final String Ft;
  final String St;
 // final String Inning;
  _third_pageState({required this.Date,required this.Match,required this.Ft,required this.St});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          leading: InkWell(onTap: (){
            Navigator.pop(context);
          },child: const Icon(Icons.arrow_back,color: Color(0xff05fc79),)),
          backgroundColor: Colors.black,
          title: Text(Ft+" v/s "+St,style: const TextStyle(color: Color(0xff05fc79)),),
          centerTitle: true,

          bottom: const TabBar(
            indicatorColor: Color(0xff05fc79),
            labelColor: Color(0xff05fc79),
            indicatorWeight: 5,
            indicatorSize:TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "1st Inning",),
              Tab(text: "2nd Inning",),
            ],
          ),
        ),
        body:TabBarView(
          children: [
            inning1(date: Date, match: Match,),
            inning2(date: Date, match: Match,)
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.grey.shade800,
          hoverColor: Colors.pink,
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cricket_players(date: Date, match: Match)));
          },
          label: Text("Players list",style: TextStyle(color: Color(0xff05fc79) ),)

        ),
      ),
    );
  }
}
//cricket_players(date: petDocs[index]['date'], match: petDocs[index]['match_no'])