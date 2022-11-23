import 'package:city_wealth_live/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import '../widgets/textfield.dart';

class ForgetPassword extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F0840),
      body: SingleChildScrollView(
        child: Column(
          children:   [
            const SizedBox(
              height: 267,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 70,
                ),
                Text("Recover", style: TextStyle(
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
                Text("Password", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF5F5F5),
                ),),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            TextInputField(
              controller: _emailController,
              labelText: "Email",
              icon: Icons.email,
            ),
            const SizedBox(
              height: 52,
            ),



            InkWell(
              onTap: () async {
                var password = await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
              },
              child: Container(
                height: 48,
                width: 136,
                decoration: BoxDecoration(
                    color:  Color(0xFFF205E2),
                    borderRadius: BorderRadius.circular(70)
                ),
                child: const Center(child: Text("Submit",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),)),
              ),
            ),
            const SizedBox(
              height: 42,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text("Don`t have an account? ", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white
                ),),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp(),));
                    print("SignUp");
                  },
                  child: const Text("Signup", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFFF205E2)
                  ),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
