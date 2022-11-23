
import 'package:city_wealth_live/screens/playstation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/textfield.dart';
import 'login.dart';


class SignUp extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _FullNameController = TextEditingController();
  SignUp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F0840),
      body: SingleChildScrollView(
        child: Column(
          children:   [
            const SizedBox(
              height: 155,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 70,
                ),
                Text("Sign up", style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF5F5F5),
                ),),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 70,
                ),
                Text("to start playing", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF5F5F5),
                ),),
              ],
            ),
            const SizedBox(
              height: 89,
            ),
            TextInputField(
              controller: _emailController,
              labelText: "Email",
              icon: Icons.email,
            ),
            const SizedBox(
              height: 31,
            ),
            TextInputField(
              controller: _FullNameController,
              labelText: "Full name",
              icon: Icons.person,
            ),
            const SizedBox(
              height: 31,
            ),

            TextInputField(
              controller: _passwordController,
              labelText: "Password",
              icon: Icons.lock,
              obscured: true,
            ),
            const SizedBox(
              height: 28,
            ),

            InkWell(
              onTap: () async {
                try{
                  if(_emailController.text.isEmpty && _passwordController.text.isEmpty&&_FullNameController.text.isEmpty){
                    Fluttertoast.showToast(
                        msg: "Enter your details correctly",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xFFF205E2),
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }else{

                    var user = FirebaseAuth.instance.currentUser;
                    var login = await FirebaseAuth.instance.createUserWithEmailAndPassword
                      (email: _emailController.text.trim(), password: _passwordController.text.trim());
                    var detail =    await FirebaseFirestore.instance.collection("Radio-Users").doc().set({
                      "Email":_emailController.text.trim(),
                      "Full name": _FullNameController.text.trim()
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlayStation(),));
                  }
                }catch (e){
                  Fluttertoast.showToast(
                      msg: "${e}",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Color(0xFFF205E2),
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                }


              },
              child: Container(
                height: 48,
                width: 136,
                decoration: BoxDecoration(
                    color:  Color(0xFFF205E2),
                    borderRadius: BorderRadius.circular(70)
                ),
                child: const Center(child: Text("Login",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),)),
              ),
            ),
            const SizedBox(
              height: 48,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text("You have an account? ", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white
                ),),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  Login(),));
                    print("Login");
                  },
                  child: const Text("Login", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFFF205E2)
                  ),),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),

          ],
        ),
      ),
    );
  }
}
