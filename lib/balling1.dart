import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class balling1 extends StatefulWidget {

  final date;
  final match;
  //final inning;
   balling1({super.key,required this.date,required this.match,});

  @override
  State<balling1> createState() => _balling1State(Date: date, Match: match,);
}

class _balling1State extends State<balling1> {
  final String Date;
  final String Match;
//  final String Inning;
  _balling1State({required this.Date,required this.Match,});
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
            Text("Balling",style: TextStyle(fontWeight: FontWeight.bold,color:Color(0xff05fc79))),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 20,width: 70,child: Center(child: Text("Name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))),
                Container(height: 20,width: 70,child: Center(child: Text("Overs",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)))),
                Container(height: 20,width: 70,child: Center(child: Text("Runs",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))),
                Container(height: 20,width: 70,child: Center(child: Text("Wickets",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))),
                Container(height: 20,width: 70,child: Center(child: Text("Average",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))),
              ],),
            Divider(thickness: 1,color: Colors.white,)
          ],
        ),),
          Container(margin: const EdgeInsets.only(top: 70),
          child:StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('cricket').doc(Date).collection('matches').
                doc(Match).collection('innings').doc('inning1').collection('performance').doc('balling').collection('players').snapshots(),
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
                                    Container(height: 20,width: 80,child: Center(child: Text(petDocs[index]['name'],style: TextStyle(color: Color(0xff05fc79))))),
                                    Container(height: 20,width: 70,child: Center(child: Text(petDocs[index]['overs'],style: TextStyle(color: Color(0xff05fc79))))),
                                    Container(height: 20,width: 70,child: Center(child: Text(petDocs[index]['runs'],style: TextStyle(color: Color(0xff05fc79))))),
                                    Container(height: 20,width: 70,child: Center(child: Text(petDocs[index]['wickets'],style: TextStyle(color: Color(0xff05fc79))))),
                                    Container(height: 20,width: 50,child: Center(child: Text((int.parse(petDocs[index]['runs'])/int.parse(petDocs[index]['overs'])).toString() ,style: TextStyle(color: Colors.deepOrange )))),
                                  ],
                                ),
                                SizedBox(height: 10,)
                              ],
                          ):
                          const Card(
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
