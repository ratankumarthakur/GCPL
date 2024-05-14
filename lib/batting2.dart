import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class batting2 extends StatefulWidget {

  final date;
  final match;
  //final inning;
   batting2({super.key,required this.date,required this.match,});

  @override
  State<batting2> createState() => _batting2State(Date: date, Match: match,);
}

class _batting2State extends State<batting2> {
  final String Date;
  final String Match;
  //final String Inning;
  _batting2State({required this.Date,required this.Match,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
          children:[
            Container(margin: const EdgeInsets.all(10),
              color: Colors.grey.shade900,
              child: Column(
                children: [
                  Text("Batting",style: TextStyle(fontWeight: FontWeight.bold,color:Color(0xff05fc79) )),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(height: 20,width: 70,child: Center(child: Text("Name",style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),))),
                      Container(height: 20,width: 50,child: Center(child: Text("Runs",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))),
                      Container(height: 20,width: 50,child: Center(child: Text("Balls",style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold)))),
                      Container(height: 20,width: 50,child: Center(child: Text("Fours",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold )))),
                      Container(height: 20,width: 40,child: Center(child: Text("Sixes",style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold)))),
                      Container(height: 20,width: 50,child: Center(child: Text("St. R.",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold )))),

                    ],),
                  Divider(thickness: 1,color: Colors.white,),
                ],
              ),),
            Container(margin: const EdgeInsets.only(top: 70),
              child:StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('cricket').doc(Date).collection('matches').
                doc(Match).collection('innings').doc('inning2').collection('performance').doc('batting').collection('players').snapshots(),
                builder: (context, petSnapshot) {
                  if (petSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: Color(0xff05fc79),),
                    );
                  } else {
                    final petDocs = petSnapshot.data!.docs;
                    return ListView.builder (
                        itemCount: petDocs.length,
                        itemBuilder: (context, index) {
                          return petSnapshot.data!.docs.isNotEmpty?
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(height: 20,width: 80,child: Center(child: Text(petDocs[index]['name'],style: TextStyle(color: Color(0xff05fc79)),))),
                                  Container(height: 20,width: 50,child: Center(child: Text(petDocs[index]['runs'],style: TextStyle(color: Color(0xff05fc79)),))),
                                  Container(height: 20,width: 50,child: Center(child: Text(petDocs[index]['balls'],style: TextStyle(color: Color(0xff05fc79)),))),
                                  Container(height: 20,width: 50,child: Center(child: Text(petDocs[index]['fours'],style: TextStyle(color: Color(0xff05fc79)),))),
                                  Container(height: 20,width: 50,child: Center(child: Text(petDocs[index]['sixes'],style: TextStyle(color: Color(0xff05fc79)),))),
                                  Container(height: 20,width: 50,child: Center(child: Text((int.parse(petDocs[index]['runs'])*100/int.parse(petDocs[index]['balls'])).toString() ,style: TextStyle(color: Colors.deepOrange )))),
                                ],
                              ),
                              SizedBox(height: 10,)

                            ],
                          ):
                          const Card(
                            color: Colors.blue,
                            elevation: 10,
                            child: ListTile(
                              title: Text("no data"),
                            ),
                          );
                        });
                  }
                },
              ),
            ),]
      ),
    );
  }
}


