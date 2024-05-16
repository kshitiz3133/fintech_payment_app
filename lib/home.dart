import 'package:fintech_payment_app/animation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool flag=false;
  Widget A= const Cat();


  void check() async{
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      A=const Bat();
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
              flag? A:const Text("₹100",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 40),),
              ElevatedButton(onPressed: (){
                setState(() {
                  flag=true;
                  check();
                });
              }, child: const Text("Send"))
            ],
          ),
        ),
      ),
    );
  }
}
