import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket/cricket_players.dart';
import 'package:cricket/third_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class dates extends StatefulWidget {
   dates({super.key});

  @override
  State<dates> createState() => _datesState();
}
//petDocs[index]['date']
class _datesState extends State<dates> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text("Cricket",style: TextStyle(color: Colors.white),),
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
          stream: FirebaseFirestore.instance.collection('cricket').orderBy("date",descending: true).snapshots(),
          builder: (context, petSnapshot) {

            if (petSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xff05fc79),),
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
                                stream: FirebaseFirestore.instance.collection('cricket').doc(petDocss[index]['date'],)
                                    .collection('matches').orderBy('match_no',descending: true).snapshots(),
                                builder: (context, petSnapshot) {
                                  if (petSnapshot.connectionState == ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(color: Color(0xff05fc79),),
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
                                              InkWell(
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context)=>third_page(
                                                        date: petDocs[index]['date'], match: petDocs[index]['match_no'], ft: petDocs[index]['1st_team_name'], st: petDocs[index]['2nd_team_name'],)));
                                                },
                                                child: Card(
                                                  shadowColor:Color(0xff05fc79) ,
                                                  elevation: 30,
                                                  color: Color(0xff05fc79),
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
                                                                Text(petDocs[index]['1st_team_name'],style: const TextStyle(fontWeight: FontWeight.bold,color: Color(0xff05fc79 ),),),
                                                                Text("v/s",style:TextStyle(color: Colors.white)),
                                                                Text(petDocs[index]['2nd_team_name'],style: const TextStyle(fontWeight: FontWeight.bold,color: Color(0xff05fc79),))
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
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(petDocs[index]['result'],style: TextStyle(color: Color(0xff05fc79)),)
                                                              ],
                                                            ),
                                                            const Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text("Man of the match",style: TextStyle(color: Color(0xfffc4c00),fontWeight: FontWeight.bold,fontSize: 16),)
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(petDocs[index]['motm'],style: TextStyle(color: Color(0xfffc4c00),fontWeight: FontWeight.bold,fontSize: 16),)
                                                              ],
                                                            ),
                                                            SizedBox(height: 5,),
                                                            ElevatedButton(onPressed: (){
                                                              _launchURL(petDocs[index]['url']);
                                                            }, child: Text("Watch highlights",style: TextStyle(color: Colors.black),))
                                                          ],
                                                        ),
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
_launchURL(String val) async {
  final Uri url = Uri.parse(val);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}