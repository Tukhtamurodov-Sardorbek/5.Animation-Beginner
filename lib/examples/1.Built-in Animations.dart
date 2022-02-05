import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';

class BuiltInAnimation extends StatefulWidget {
  const BuiltInAnimation({Key? key}) : super(key: key);
  static const String id = 'built_in_animation';

  @override
  _BuiltInAnimationState createState() => _BuiltInAnimationState();
}

class _BuiltInAnimationState extends State<BuiltInAnimation> {
  int count = 0, colorIndex = 0;
  double _borderRadius = 0;
  double _margin = 0;
  double _opacity = 1;
  double _width = double.infinity;
  Color _color = CupertinoColors.activeBlue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          margin: EdgeInsets.all(_margin),
          width: _width,

          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                color: CupertinoColors.systemTeal,
                child: const Text('Animate margin', textAlign: TextAlign.center),
                onPressed: () {
                  setState(() {
                    _margin < 150 ? _margin += 10.0 : _margin = 0;
                  });
                },
              ),
              MaterialButton(
                color: CupertinoColors.systemTeal,
                child: const Text('Animate color', textAlign: TextAlign.center),
                onPressed: () {
                  setState(() {
                    _color = Colors.accents[colorIndex];
                    colorIndex + 1 < 16 ? colorIndex++ : colorIndex = 0;
                  });
                  print('$colorIndex');
                },
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _opacity,
                child: Container(
                    color: CupertinoColors.systemTeal,

                    child: const Text('Hide', style: TextStyle(fontWeight: FontWeight.bold),)
                )
              ),
              MaterialButton(
                color: CupertinoColors.systemTeal,
                child: const Text('Animate opacity', textAlign: TextAlign.center),
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
              ),
              MaterialButton(
                color: CupertinoColors.systemTeal,
                child: const Text('Animate Border', textAlign: TextAlign.center),
                onPressed: () {
                  setState(() {
                    _borderRadius > 180 ? _borderRadius = 0 : _borderRadius += 10;
                  });
                  print('Border: $_borderRadius');
                },
              ),
              MaterialButton(
                color: CupertinoColors.systemTeal,
                child: const Text('Animate width', textAlign: TextAlign.center),
                onPressed: () {
                  setState(() {
                    _width > MediaQuery.of(context).size.width ? _width = 200 :  _width += 10;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
