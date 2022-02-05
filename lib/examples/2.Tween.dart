import 'package:flutter/material.dart';

class TweenAnimations extends StatefulWidget {
  const TweenAnimations({Key? key}) : super(key: key);
  static const String id = 'tween_animation';

  @override
  _TweenAnimationsState createState() => _TweenAnimationsState();
}

class _TweenAnimationsState extends State<TweenAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: TweenAnimationBuilder(
          child: const Text('This is an app bar', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          tween: Tween<double> (begin: 0, end: 1),
          duration: const Duration(milliseconds: 500),
          builder: (BuildContext context, double opacityValue, Widget? child){
            return Opacity(
              opacity: opacityValue,
              child: Padding(
                padding: EdgeInsets.only(top: opacityValue * 20),
                child: child,
              ),
            );
          },

        ),
      ),
    );
  }
}
