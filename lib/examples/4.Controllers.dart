import 'package:flutter/material.dart';

class AnimationsController extends StatefulWidget {
  const AnimationsController({Key? key}) : super(key: key);
  static const String id = 'animation_controller';

  @override
  _AnimationsControllerState createState() => _AnimationsControllerState();
}

class _AnimationsControllerState extends State<AnimationsController> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation _colorAnimation;
  bool isLiked = false;
  late Animation<double> _sizeAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _controller = AnimationController(
        duration: const Duration(milliseconds: 250),
        vsync: this,
      );
      _colorAnimation = ColorTween(
        begin: Colors.grey[400],
        end: Colors.red,
      ).animate(_controller);
      _sizeAnimation = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
              tween: Tween<double>(begin: 30, end: 36),
              weight: 50
          ),
          TweenSequenceItem<double>(
              tween: Tween<double>(begin: 36, end: 30),
              weight: 50
          ),
        ]
      ).animate(_controller);
    });
    // _controller.forward(); // to make automatic

    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimation.value);
      print(_sizeAnimation.value);
      // setState(() {});
    });

    _controller.addStatusListener((status) {
      print(status);
      if(status == AnimationStatus.completed){
        setState(() {
          isLiked = true;
        });
      }
      if(status == AnimationStatus.dismissed){
        setState(() {
          isLiked = false;
        });
      }

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const Expanded(
            child: Image(
                image: AssetImage('assets/profile_pictures/girls/girl5.jpg'),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Anastasia'),
                  subtitle: const Text('patience led us here'),
                  trailing: AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, _){
                      return IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: _colorAnimation.value,
                          size: _sizeAnimation.value,
                        ),
                        onPressed: (){
                          isLiked ? _controller.reverse() : _controller.forward();
                        },
                      );
                    },
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
