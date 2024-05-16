import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Animations/wave.dart';
import '../Login/login.dart';
import '../auth.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController=TextEditingController();

  final passwordController=TextEditingController();
  final confirmpasswordController=TextEditingController();


  //create new user
  void register()async{
    try {
      if(passwordController.text==confirmpasswordController.text) {
        showModalBottomSheet(context: context, builder: (context)=> const SizedBox(height: 200,child: Text("Registered!"),));
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: '${emailController.text}@gmail.com',
          password: passwordController.text,
        );
        //after creating new user, create a document for new user in collection
        await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({
          'uid': FirebaseAuth.instance.currentUser!.uid,
          'email': FirebaseAuth.instance.currentUser!.email,
        },SetOptions(merge: true));
        //user added successfully
        print('done');

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AuthPage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyAnimation(),
              const SizedBox(height: 15,),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text('Register',style: TextStyle(fontSize: 50),),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black, // Color of the border when not focused
                        width: 4.0, // Increase the outline thickness
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black, // Color of the border when not focused
                        width: 1.0, // Increase the outline thickness
                      ),
                    ),
                    hintText: 'Email Address',
                    hintStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 30),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black, // Color of the border when not focused
                        width: 4.0, // Increase the outline thickness
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black, // Color of the border when not focused
                        width: 1.0, // Increase the outline thickness
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 30),
                child: TextField(
                  obscureText: true,
                  controller: confirmpasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black, // Color of the border when not focused
                        width: 4.0, // Increase the outline thickness
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black, // Color of the border when not focused
                        width: 1.0, // Increase the outline thickness
                      ),
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  register();
                },
                child: Container(
                  height: 38,
                  width: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xff6796e9),
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child:Text('Register',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)),
                ),
              ),
              const SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already registered? ',style: TextStyle(fontSize: 18),),
                  GestureDetector(onTap: (){
                    Navigator.push(context,
                        PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) { return const Login();}));                },child: const Text('Login',style: TextStyle(fontSize: 18,color: Color(0xff6796e9)),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
