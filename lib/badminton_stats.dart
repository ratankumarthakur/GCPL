import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class badminton_stats extends StatefulWidget {
  const badminton_stats({super.key});

  @override
  State<badminton_stats> createState() => _badminton_statsState();
}

class _badminton_statsState extends State<badminton_stats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.grey.shade900,
        title: Text("Badminton Stats",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
                            color:Colors.pink,
                            spreadRadius: 11
                        )
                      ]
                  ),
                  height: 40,
                  child: const Center(
                      child: Text("Best Players",
                          style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 25 )
                      )
                  )
              ),
            ),
            Container(//margin: const EdgeInsets.only(top: 70,),
              //height: 100,
              child:StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('badminton_stats').orderBy('rank',).snapshots(),
                builder: (context, petSnapshot) {
                  if (petSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color:Colors.pink),
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
                                            style: TextStyle(color: index!=0?Colors.white:Colors.pink,fontSize: index==0?25:15 )))),
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


