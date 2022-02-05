import 'package:flutter/material.dart';

import 'classes/1.Basic.dart';
import 'concepts/1.Basics.dart';
import 'examples/1.Built-in Animations.dart';
import 'examples/2.Tween.dart';
import 'examples/3.Hero.dart';
import 'examples/4.Controllers.dart';
import 'examples/5.Curves.dart';
import 'examples/6.AnimatedList.dart';
import 'home_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        Basics.id: (context) => const Basics(),
        FirstAnimation.id: (context) => const FirstAnimation(),
        BuiltInAnimation.id: (context) => const BuiltInAnimation(),
        TweenAnimations.id: (context) => const TweenAnimations(),
        HeroAnimations.id: (context) => const HeroAnimations(),
        AnimationsController.id: (context) => const AnimationsController(),
        CurvedAnimations.id: (context) => const CurvedAnimations(),
        AnimatedLists.id: (context) => const AnimatedLists(),
      },
    );
  }
}
