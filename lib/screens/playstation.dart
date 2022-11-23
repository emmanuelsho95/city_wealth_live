
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart';
import 'package:audioplayers/audioplayers.dart';


class PlayStation extends StatefulWidget {
   PlayStation({Key? key}) : super(key: key);

  @override
  State<PlayStation> createState() => _PlayStationState();
}

class _PlayStationState extends State<PlayStation> {
  bool visiblity = true;
  final player = AudioPlayer();
  playAgain() async {
    await player.play(UrlSource("https://cast4.asurahosting.com/proxy/emmanue1/stream"));

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playAgain();
  }



  @override
  Widget build(BuildContext context) {
    TextEditingController _commentController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFF1F0840),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  const SizedBox(height: 29,),
                  Padding(
                    padding: const EdgeInsets.only(right: 29),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){
                          try{
                            FirebaseAuth.instance.signOut();
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Login();
                            },
                            ));
                          }catch(e){
                          }

                        }, icon: const Icon(Icons.logout, color: Colors.white,)),

                      ],
                    ),
                  ),
                  SizedBox(height: 82,),
                  const Image(image: AssetImage("assets/img_1.png"), width: 340, height: 430,),
                  const SizedBox(height: 27,),

                  const Text("MOMENT OF PRAYER",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: 20,),
                  const Text("omowumi",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        //TODO: thumb up
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.thumb_up,
                            size: 30, color: Colors.white,)),


                        ],
                      ),
                      const SizedBox(width: 100,),

                      IconButton(onPressed: () async {
                        visiblity==true?visiblity=false:visiblity=true;
                        setState(() {
                        });
                        if(visiblity==true){
                          Fluttertoast.showToast(
                              msg: "waiting...it will soon start playing",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 10,

                              backgroundColor: Color(0xFFF205E2),
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                          playAgain();
                        }else if(visiblity==false){
                          Fluttertoast.showToast(
                              msg: "you have stop the radio",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xFFF205E2),
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                          await player.stop();
                        }
                        }, icon:  Icon( visiblity==true?Icons.play_circle:Icons.pause_circle,
                        size: 60, color: Color(0xFFF205E2),)),


                      const SizedBox(width: 100,),
                        //TODO: share
                      IconButton(onPressed: (){}, icon: const Icon(Icons.share,
                        size: 30, color: Colors.white,)),


                    ],
                  )

                ],
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)
                    )

                ),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 23, right: 45, left: 45),
                  child: TextFormField(
                    controller: _commentController,
                    cursorColor: Color.fromARGB(128, 255, 255, 255),
                    style: const TextStyle(
                      // color: Color.fromARGB(128, 255, 255, 255)
                    ),
                    decoration: InputDecoration(
                      hintText: "Comment",
                      fillColor: Color(0xFFEDEAF0),
                      filled: true,
                      suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.send),
                        color: const Color(0xFF1F0840),),

                      enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color(0xFFEDEAF0)

                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Color(0xFFEDEAF0),

                          )
                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }

}

