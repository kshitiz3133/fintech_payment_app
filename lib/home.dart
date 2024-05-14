import 'package:fintech_payment_app/animation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool flag=false;
  Widget A= Cat();


  void check() async{
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      A=Bat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              flag? A:Text("₹100",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 40),),
              ElevatedButton(onPressed: (){
                setState(() {
                  flag=true;
                  check();
                });
              }, child: Text("Send"))
            ],
          ),
        ),
      ),
    );
  }
}
