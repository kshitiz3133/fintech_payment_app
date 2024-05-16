import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Animations/circlezoomanimation.dart';
import 'Register/register.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //logged in
          if(snapshot.hasData){
            return const MyCircularContainer();
          }
          //if not logged in
          else {
            return const Register();
          }
        },
      ),
    );
  }
}
