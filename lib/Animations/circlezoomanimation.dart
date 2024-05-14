import 'package:fintech_payment_app/Authentication/Account/account.dart';
import 'package:fintech_payment_app/home.dart';
import 'package:flutter/material.dart';

class MyCircularContainer extends StatefulWidget {
  @override
  _MyCircularContainerState createState() => _MyCircularContainerState();
}

class _MyCircularContainerState extends State<MyCircularContainer>
    with TickerProviderStateMixin {
  double scaleFactor = 1.0,
      a = 0.0,b=1.0;
  late AnimationController _controller;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late Animation<double> _scalinganimation;
  late Animation<double> _opacity1;
  late Animation<double> _opacity2;
  bool shouldscale = false;

  @override
  void initState() {
    super.initState();
    _controller2 = AnimationController(
        vsync: this, duration: Duration(seconds: 1));
    _controller3 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 400))..forward();
    _opacity1=Tween(begin: 1.0,end: 0.0).animate(_controller2);
    Future.delayed(Duration(milliseconds: 900), () {
      setState(() {
        shouldscale = true;
      });
      // code to be executed after 2 seconds
      //animation conroller
      _controller = AnimationController(
          vsync: this, duration: Duration(seconds: 2, milliseconds: 100))
        ..forward();




      _scalinganimation = Tween(begin: 0.0, end: 0.3).animate(CurvedAnimation(
          parent: _controller, curve: Curves.fastLinearToSlowEaseIn));

      _opacity2=Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _controller3, curve: Curves.easeOut));

      _controller.addListener(() {
        setState(() {});
      });


      Future.delayed(Duration(seconds: 1,milliseconds: 700), () {
        setState(() {
          a = 2.0;
        });
      });
      Future.delayed(Duration(seconds: 3,milliseconds: 500), () {
        setState(() {
          _controller2.forward();
        });
      });
    });

    Future.delayed(Duration(seconds: 4,milliseconds: 700), () {
      Navigator.push(context,
          PageRouteBuilder(
              transitionDuration: Duration(seconds: 1),
              pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) { return FadeTransition(opacity: _opacity2,child: Account());}));
    });
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: FadeTransition(
        opacity: _opacity1,
        child: Center(
          child: AnimatedScale(
            curve: Curves.fastLinearToSlowEaseIn,
            scale: shouldscale ? _scalinganimation.value + a : 0.0,
            duration: Duration(seconds: 1),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff6796e9),
              ),
              // Add your content inside the circular container
            ),
          ),
        ),
      ),
    );
  }
}
