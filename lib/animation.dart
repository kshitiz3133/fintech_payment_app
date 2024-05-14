import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Cat extends StatefulWidget {
  const Cat({Key? key}) : super(key: key);

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(duration: Duration(seconds: 2,milliseconds: 500),vsync: this)..repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Lottie.network(
          "https://lottie.host/0222bc02-257c-4e41-bf47-68b34e99319a/etzLfd2WBe.json",
          controller: _controller
      ),
    );
  }
}

class Bat extends StatefulWidget {
  const Bat({Key? key}) : super(key: key);

  @override
  State<Bat> createState() => _BatState();
}

class _BatState extends State<Bat> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(duration: Duration(seconds: 1,milliseconds: 500),vsync: this)..repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Lottie.network(
          "https://lottie.host/ee318cca-0baa-4ef2-903b-2a40fa143ee3/cV2BU1bFbb.json",
          controller: _controller
      ),
    );
  }
}
