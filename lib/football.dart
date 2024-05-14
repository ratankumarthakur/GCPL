import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class football extends StatefulWidget {
  const football({super.key});

  @override
  State<football> createState() => _footballState();
}

class _footballState extends State<football> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text("Football",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },child: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
      body: Container(margin:  EdgeInsets.all(20),
        //height: MediaQuery.of(context).size.height/2,
        //width:MediaQuery.of(context).size. width,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('football').orderBy("date",descending: true).snapshots(),
          builder: (context, petSnapshot) {
            if (petSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.cyan,),
              );
            } else {
              final petDocss = petSnapshot.data!.docs;
              return ListView.builder (
                  shrinkWrap: true,
                  itemCount: petDocss.length,
                  itemBuilder: (context, index) {
                    return petSnapshot.data!.docs.isNotEmpty?
                    Card(
                        color: Color(0x3635351A),//Color(0x3635351A)
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Center(child:
                          Container(margin:  EdgeInsets.all(20),
                            //height: MediaQuery.of(context).size.height/2,
                            // width:MediaQuery.of(context).size. width,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection('football').doc(petDocss[index]['date'],)
                                  .collection('matches').orderBy('match_no',descending: true).snapshots(),
                              builder: (context, petSnapshot) {
                                if (petSnapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(color: Colors.cyan,),
                                  );
                                } else {
                                  final petDocs = petSnapshot.data!.docs;
                                  return Column(
                                    children: [
                                      Text(petDocss[index]['date'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                      SizedBox(height: 10,),
                                      ListView.builder (
                                          shrinkWrap: true,
                                          itemCount: petDocs.length,
                                          itemBuilder: (context, index) {
                                            return petSnapshot.data!.docs.isNotEmpty?
                                            Card(
                                                shadowColor:Colors.cyan ,
                                                elevation: 30,
                                                color: Colors.cyan,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(1.0),
                                                  child: Card(

                                                    color: Colors.black,
                                                    child: Padding(
                                                      padding:  EdgeInsets.all(18.0),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(height: 20,),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(petDocs[index]['1st_team_name'],style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.cyan,),),
                                                              Text("v/s",style:TextStyle(color: Colors.white)),
                                                              Text(petDocs[index]['2nd_team_name'],style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.cyan,))
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(petDocs[index]['1st_team_score'],style: TextStyle(color: Colors.white),),
                                                              Text(petDocs[index]['2nd_team_score'],style: TextStyle(color: Colors.white),)
                                                            ],
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(petDocs[index]['1st_team_goal_scorers'],style: TextStyle(color: Colors.white),),
                                                              Text(petDocs[index]['2nd_team_goal_scorers'],style: TextStyle(color: Colors.white),)
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ):
                                            const Card(
                                              color: Colors.blue,
                                              elevation: 10,
                                              child: ListTile(
                                                title: Text("no data"),
                                              ),
                                            );
                                          }),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),),
                        ))
                        :
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
    );
  }
}
