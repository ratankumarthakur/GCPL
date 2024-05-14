import 'package:audioplayers/audioplayers.dart';
import 'package:cricket/badminton.dart';
import 'package:cricket/cricket_stats.dart';
import 'package:cricket/dates.dart';
import 'package:cricket/football.dart';
import 'package:flutter/material.dart';

import 'badminton_stats.dart';
import 'football_stats.dart';

class sports extends StatefulWidget {
  const sports({super.key});

  @override
  State<sports> createState() => _sportsState();
}

class _sportsState extends State<sports> {

  static bool isPlaying=false;

  static final player = AudioPlayer();

  @override
  void initState() {
        
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying =state == PlayerState.playing;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("💫💫  Sports  💫💫",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20,),
            Card(
              color: Color(0xff05fc79),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>dates()));
                },
                child: Card(
                  elevation: 40,
                  color: Colors.grey.shade900,
                  shadowColor: Color(0xff05fc79),
                  child:Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/cricket1.png',width: 50,height: 50,),
                        Center(child: Text("Cricket",style: TextStyle(color: Color(0xff05fc79),fontSize: 25),)),
                        ElevatedButton(
                            onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cricket_stats()));
                        }, child: Text("See stats"))
                      ],
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Card(
              color: Colors.cyan,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>football()));
                },
                child: Card(
                  elevation: 40,
                  color: Colors.grey.shade900,
                  shadowColor: Colors.cyan,
                  child:Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/soccer.png',width: 50,height: 50,),
                        Text("Football",style: TextStyle(color: Colors.cyan,fontSize: 25),),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>football_stats()));
                            }, child: Text("See stats"))
                      ],
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Card(
              color: Colors.pink,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>badminton()));
                },
                child: Card(
                  elevation: 40,
                  color: Colors.grey.shade900,
                  shadowColor: Colors.pink,
                  child:Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/badminton.png',width: 50,height: 50,),
                        Text("Badminton",style: TextStyle(color: Colors.pink,fontSize: 25),),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>badminton_stats()));
                            }, child: Text("See stats"))
                      ],
                    )
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
             MaterialButton(
                child: Text(isPlaying?"Pause":"Play IPL song",style: TextStyle(color: Colors.white),),
                color: Colors.grey.shade900,
                onPressed: (){
                  fun();
                },
              ),
            ],)
          ],
        ),
      ),
    );
  }
  void fun(){
    if(isPlaying){
      player.pause();
    }
    else{
      player.play(AssetSource("ipl.mp3"));
    }
  }

}



