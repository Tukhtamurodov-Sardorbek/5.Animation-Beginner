import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstAnimation extends StatefulWidget {
  const FirstAnimation({Key? key}) : super(key: key);
  static const String id = 'first_animation';

  @override
  _FirstAnimationState createState() => _FirstAnimationState();
}
class _FirstAnimationState extends State<FirstAnimation> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation growAnimation;

  @override
  void initState() {
  super.initState();
  controller =
  AnimationController(vsync: this, duration: const Duration(seconds: 3))
    ..addListener(() {
      setState((){});
    });
  growAnimation = Tween<double>(begin: 0, end: 200).animate(controller);
  controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: growAnimation.value,
          width: growAnimation.value,
          color: CupertinoColors.systemGreen,
        ),
      ),
    );
  }
}

