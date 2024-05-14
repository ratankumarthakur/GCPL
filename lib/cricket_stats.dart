import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class cricket_stats extends StatefulWidget {
  const cricket_stats({super.key});

  @override
  State<cricket_stats> createState() => _cricket_statsState();
}

class _cricket_statsState extends State<cricket_stats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.grey.shade900,
        title: Text("Cricket Stats",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.grey.shade900,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 11,
                            color:Colors.deepOrange,
                            spreadRadius: 11
                        )
                      ]
                  ),
                  height: 40,
                  child: const Center(
                      child: Text("Orange cap",
                          style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 25 )
                      )
                  )
              ),
            ),
            Container(//margin: const EdgeInsets.only(top: 70,),
              //height: 100,
              child:StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('cricket_stats').doc('batting').collection('bat').orderBy('runs',descending: true).snapshots(),
                builder: (context, petSnapshot) {
                  if (petSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color:Colors.deepOrange),
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
                                padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(height: index==0?30:20,
                                        child: Center(child:
                                        Text(petDocs[index]['name'],
                                            style: TextStyle(color: index!=0?Colors.white:Colors.deepOrange,fontSize: index==0?25:15 )))),
                                    Container(height: index==0?30:20,
                                        child: Center(child:
                                        Text(petDocs[index]['runs'],
                                            style: TextStyle(color: index!=0?Colors.white:Colors.deepOrange,fontSize: index==0?25:15 )))),
                                  ],
                                ),
                              ),
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
            SizedBox(height: 50,),
        
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.grey.shade900,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 11,
                            color:Colors.purple,
                            spreadRadius: 11
                        )
                      ]
                  ),
                  height: 40,
                  child: const Center(
                      child: Text("Purple cap",
                          style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 25 )
                      )
                  )
              ),
            ),
            Container(//margin: const EdgeInsets.only(top: 70,),
              //height: 100,
              child:StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('cricket_stats').doc('balling').collection('ball').orderBy('wickets',descending: true).snapshots(),
                builder: (context, petSnapshot) {
                  if (petSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color:Colors.deepPurple),
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
                                padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(height: index==0?30:20,
                                        child: Center(child:
                                        Text(petDocs[index]['name'],
                                            style: TextStyle(color: index!=0?Colors.white:Colors.deepPurple,fontSize: index==0?25:15 )))),
                                    Container(height: index==0?30:20,
                                        child: Center(child:
                                        Text(petDocs[index]['wickets'],
                                            style: TextStyle(color: index!=0?Colors.white:Colors.deepPurple,fontSize: index==0?25:15 )))),
                                  ],
                                ),
                              ),
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
            SizedBox(height: 50,),
        
        
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
                  child: const Center(
                      child: Text("Green cap",
                          style: TextStyle(color: Color(0xff05fc79),fontWeight: FontWeight.bold,fontSize: 25 )
                      )
                  )
              ),
            ),
            Container(//margin: const EdgeInsets.only(top: 70,),
              //height: 100,
              child:StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('cricket_stats').doc('fielding').collection('field').orderBy('catches',descending: true).snapshots(),
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
                                padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(height: index==0?30:20,
                                        child: Center(child:
                                        Text(petDocs[index]['name'],
                                            style: TextStyle(color: index!=0?Colors.white:Color(0xff05fc79),fontSize: index==0?25:15 )))),
                                    Container(height: index==0?30:20,
                                        child: Center(child:
                                        Text(petDocs[index]['catches'],
                                            style: TextStyle(color: index!=0?Colors.white:Color(0xff05fc79),fontSize: index==0?25:15 )))),
                                  ],
                                ),
                              ),
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
            SizedBox(height: 50,),
        
          ],
        ),
      ),
    );
  }
}
