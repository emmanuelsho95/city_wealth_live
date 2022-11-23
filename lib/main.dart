import 'package:city_wealth_live/screens/login.dart';
import 'package:city_wealth_live/screens/playstation.dart';
import 'package:city_wealth_live/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}

var auth = FirebaseAuth.instance;
var isLogin = false;


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {

      return MaterialApp(
        title: 'city_wealth_live',
        debugShowCheckedModeBanner: false,
        home: (checkUserState() == true ?  PlayStation() : new Login()),
      );
    },);
  }



  bool checkUserState() {
    return !(auth.currentUser == null);
  }

}