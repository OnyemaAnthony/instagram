import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram/responsive/responsive_layout_screen.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/mobile_screen.dart';
import 'package:instagram/screens/web_screen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isIOS){
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Instagram',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      //home: const ResponsiveLayoutScreen(mobileScreenLayout: MobileScreen(),webScreenLayout: WebScreen(),),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              return const ResponsiveLayoutScreen(mobileScreenLayout: MobileScreen(), webScreenLayout: WebScreen());

            }else{
              return Center(child: Text('${snapshot.error}'),);
            }
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: primaryColor,),);
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
