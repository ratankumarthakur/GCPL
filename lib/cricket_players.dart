import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class cricket_players extends StatefulWidget {
  final date;
  final match;
  cricket_players({super.key,required this.date,required this.match});

  @override
  State<cricket_players> createState() => _cricket_playersState(Date: date, Match: match);
}

class _cricket_playersState extends State<cricket_players> {
  final String Date;
  final String Match;
  _cricket_playersState({required this.Date,required this.Match,});
  bool sel=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.grey.shade900,
        title: Text("Player list",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(//margin: const EdgeInsets.only(top: 70,),
            //height: 100,
              child:StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('cricket').doc(Date).collection('matches').
                doc(Match).collection('innings').snapshots(),
                builder: (context, petSnapshot) {
                  if (petSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color:Color(0xff05fc79)),
                    );
                  } else {
                    final petDocs = petSnapshot.data!.docs;
                    return ListView.builder (
                      shrinkWrap: true,
                        itemCount: petDocs.length,
                        itemBuilder: (context, index) {
                          return petSnapshot.data!.docs.isNotEmpty?
                          Column(
                            children: [

                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.grey.shade900,
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 11,
                                                color:Color(0xff05fc79),
                                                spreadRadius: 11
                                            )
                                          ]
                                      ),
                                      height: 40,
                                      child: Center(
                                          child: Text(petDocs[index]['team_name'],
                                              style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold )))),
                                ),
                              Container(height: 100,child: Center(child: Text(petDocs[index]['team_squad'],style: TextStyle(color: Color(0xff05fc79) )))),

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
            ),

          ],
        ),
      ),
    );
  }
}
