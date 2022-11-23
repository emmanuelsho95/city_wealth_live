// import 'package:city_wealth/screens/forgetpassword.dart';
// import 'package:city_wealth/screens/playstation.dart';
// import 'package:city_wealth/screens/signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:city_wealth_live/screens/playstation.dart';
import 'package:city_wealth_live/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/textfield.dart';
import 'forgetpassword.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF1F0840),
      body: SingleChildScrollView(
        child: Column(
          children:   [
            const SizedBox(
              height: 242,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 70,
                ),
                Text("Login", style: TextStyle(
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
              height: 23,
            ),
            TextInputField(
              controller: _emailController,
              labelText: "Email",
              icon: Icons.email,
            ),
            const SizedBox(
              height: 35,
            ),
            TextInputField(
              controller: _passwordController,
              labelText: "Password",
              icon: Icons.lock,
              obscured: true,
            ),
            const SizedBox(
              height: 29,
            ),

            InkWell(
              onTap: () async {
                print("login");
                try{
                  if(_emailController.text.isEmpty && _passwordController.text.isEmpty){
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

                    var login = await FirebaseAuth.instance.signInWithEmailAndPassword
                      (email: _emailController.text.trim(), password: _passwordController.text.trim());
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
            const SizedBox(
              height: 28,
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  ForgetPassword(),));
                print("Forget Password");
              },
              child: const Text("Forget Password?", style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white
              ),),
            ),

          ],
        ),
      ),
    );
  }
}
