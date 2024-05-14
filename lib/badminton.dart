import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class badminton extends StatefulWidget {
  const badminton({super.key});

  @override
  State<badminton> createState() => _badmintonState();
}

class _badmintonState extends State<badminton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text("Badminton",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },child: Icon(Icons.arrow_back,color: Colors.white,)),

      ),
      backgroundColor: Colors.black,
      body: Container(margin:EdgeInsets.all(20),
        //height: MediaQuery.of(context).size.height/2,
        //width:MediaQuery.of(context).size. width,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('badminton').orderBy("date",descending: true).snapshots(),
          builder: (context, petSnapshot) {

            if (petSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.pink,),
              );
            } else {
              final petDocss = petSnapshot.data!.docs;
              return ListView.builder (
                  shrinkWrap: true,
                  itemCount: petDocss.length,
                  itemBuilder: (context, index) {
                    return petSnapshot.data!.docs.isNotEmpty?
                    Card(
                        color: Colors.grey.shade900,//Color(0x3635351A)
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Center(child:
                          Container(margin:  EdgeInsets.all(20),
                            //height: MediaQuery.of(context).size.height/2,
                            // width:MediaQuery.of(context).size. width,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection('badminton').doc(petDocss[index]['date'],)
                                  .collection('matches').orderBy('match_no',descending: true).snapshots(),
                              builder: (context, petSnapshot) {
                                if (petSnapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(color: Colors.pink,),
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
                                              shadowColor:Colors.pink ,
                                              elevation: 30,
                                              color: Colors.pink,
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
                                                            Text(petDocs[index]['1st_player'],style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.pink,),),
                                                            Text("v/s",style:TextStyle(color: Colors.white)),
                                                            Text(petDocs[index]['2nd_player'],style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.pink,))
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(petDocs[index]['1st_player_points'],style: TextStyle(color: Colors.white),),
                                                            Text(petDocs[index]['2nd_player_points'],style: TextStyle(color: Colors.white),)
                                                          ],
                                                        ),
                                                        SizedBox(height: 10,),
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
