import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final user = FirebaseAuth.instance.currentUser!;

  String getUsername(String email) {
    // Extract the username from the email address
    int atIndex = email.indexOf('@');
    return email.substring(0, atIndex);
  }

  void signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const AuthPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  'Account',
                  style: TextStyle(fontSize: 47),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,50,0,0),
              child: Text('Logged in As:',style: TextStyle(fontSize: 40,color: Color(0xffBDB0CEFF)),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 2, 60),
              // Display only the username
              child: Text(getUsername(user.email!),style: TextStyle(
                fontSize: 42,
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    signout();
                  },
                  child: Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xff6796e9),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text('Logout',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
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

