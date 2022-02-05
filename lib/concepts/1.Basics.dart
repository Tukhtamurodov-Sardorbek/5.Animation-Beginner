import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_intermediate/classes/1.Basic.dart';

class Basics extends StatefulWidget {
  const Basics({Key? key}) : super(key: key);
  static const String id = 'basics';

  @override
  _BasicsState createState() => _BasicsState();
}

class _BasicsState extends State<Basics> {
  List classes = [
    FirstAnimation()
  ];
  /// Bottom Sheet
  void _animation(BuildContext ctx, int index) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
            )
        ),
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        elevation: 5,
        context: ctx,
        builder: (ctx) => Container(
           padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
           height: MediaQuery.of(context).size.height * 0.6,
           decoration: BoxDecoration(
             border: Border.all(color: Colors.blueGrey),
             borderRadius: const BorderRadius.only(
               topRight: Radius.circular(50),
               topLeft: Radius.circular(50)
             ),
           ),
           child: classes[index],
         ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){Navigator.pop(context);},
        ),
        title: const Text('Basics', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.code, color: Colors.black),
            onPressed: (){},
          )
        ],
      ),
      body: PageView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'AnimationController: ',
                    style:  TextStyle(color: CupertinoColors.systemGreen, fontSize: 22, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'This manages the "Animation". It produces a new value for every frame that is rendered, keeps track of the animation state and exposes functionality to play (forward), reverse or stop an animation.',
                          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(thickness: 5, color: CupertinoColors.systemGrey),
                const SizedBox(height: 5),
                RichText(
                  text: const TextSpan(
                    text: 'Animation / Tween : ',
                    style:  TextStyle(color: CupertinoColors.systemGreen, fontSize: 22, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'This defines the begin and end values along with how to how move from the beginning to end through a curve. This object will notify the controller through the ValueListenable protocol whenever the value it holds has changed.',
                          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(thickness: 5, color: CupertinoColors.systemGrey),
                const SizedBox(height: 5),
                RichText(
                  text: const TextSpan(
                    text: 'Ticker : ',
                    style:  TextStyle(color: CupertinoColors.systemGreen, fontSize: 22, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'A ticker is a class that listens to frameCallback and calls a tick function that passes the elapsed duration between the current frame and the last frame to the ticker listener. In our case the controller.',
                          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(thickness: 5, color: CupertinoColors.systemGrey),
                const SizedBox(height: 5),
                RichText(
                  text: const TextSpan(
                    text: 'Using all three of these you can create a simple animation. Lets go over what process you have to go through when creating an animation. First you want to create your ',
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                    // style:  TextStyle(color: CupertinoColors.systemGreen, fontSize: 22, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'AnimationController',
                        style:  TextStyle(color: CupertinoColors.systemRed, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '. You\'ll have to keep it locally and initialise it in the initState since you need to supply "this" as your ticker provider. So you need to have a stateful widget. Then you have to extend the State of your widget with a '),
                      TextSpan(
                        text: 'TickerProviderStateMixin',
                        style:  TextStyle(color: CupertinoColors.systemRed, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '  to get your ticker mentioned in #3 above. Then we define an animation in the form of a Tween. We supply it with the controller through the animation function, keep a reference to is so we can access the value in our build function and then we start our animation by calling forward on the controller 😅. I know, somehow you get that feeling that it can be way less code, and we\'ll get there 😉'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                /// class
                const FittedBox(
                  child: Text('''class BasicAnimationView extends StatefulWidget {  
  BasicAnimationView({Key key}) : super(key: key);   
  _BasicAnimationViewState createState() => _BasicAnimationViewState();
}

class _BasicAnimationViewState extends State<BasicAnimationView> {
  AnimationController controller;
  Animation growAnimation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
'''),
                ),
                const Divider(thickness: 3),
                RichText(
                  text: const TextSpan(
                    text: 'Now lets go over the code to do everything described above. First we want to create our controller and provide it with a ticker to call our value update every frame. We\’ll do that in the ',
                    style: TextStyle(color: Colors.black),
                    // style:  TextStyle(color: CupertinoColors.systemGreen, fontSize: 22, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'initState',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: '  override'),
                    ],
                  ),
                ),
                const Divider(thickness: 3),
                /// initState
                const FittedBox(
                  child: Text('''@override
void initState() {
  super.initState();
  controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
}
'''),
                ),
                const Divider(thickness: 3),
                RichText(
                  text: const TextSpan(
                    text: 'Since “this” does not contain a ticker yet we’ll add on the functionality using a built in mixin called ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'TickerProviderStateMixin',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: ' . You can use '),
                      TextSpan(
                        text: 'SingleTickerProviderStateMixin',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: ' too if you want to be specific and indicate that there will be only one ticker available for one animation. We\'ll extend our '),
                      TextSpan(
                        text: 'State',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: ' class with it.'),
                    ],
                  ),
                ),
                const Divider(thickness: 3),
                /// TickerProviderStateMixin mixin
                const FittedBox(
                  child: Text('''class _BasicAnimationViewState extends State<BasicAnimationView>
    with SingleTickerProviderStateMixin {
    ...
}
'''),
                ),
                const Divider(thickness: 3),
                RichText(
                  text: const TextSpan(
                    text: 'Next up we have to create our animation. For this we’ll define a ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Tween<double>',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: ' that will progress from 0 to 200 and we\'ll get the Animation object from this tween by calling animate and supplying the controller that will be managing the values and additionally start the animation.'),
                    ],
                  ),
                ),
                const Divider(thickness: 3),
                const FittedBox(
                  child: Text('''@override
void initState() {
  super.initState();
  controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
  growAnimation = Tween<double>(begin: 0, end: 200).animate(controller);
  controller.forward();
}
'''),
                ),
                const Divider(thickness: 3),
                /// Animation Usage
                RichText(
                  text: const TextSpan(
                    text: 'If you run the code above you’ll see that nothing happens even though the animation is running and that’s because it’s not hooked up to anything. First lets see where we could intercept the values to see what this is doing. On the controller we’ll add a listener that will get fired whenever a new values is calculated for a frame. We’ll use that and print out the current value for the ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'growAnimation',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 3),
                const FittedBox(
                  child: Text('''controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..addListener(() {
            print(\'GrowAnimation value: \${growAnimation.value}\');
          });
'''),
                ),
                const Divider(thickness: 3),
                RichText(
                  text: const TextSpan(
                    text: 'If you run this now you’ll see the values printed out from 0 to 200 in your console. This indicates to us that on every frame the value has been updated. And with this information we can create our animation. To start off we’ll just show how to animate a simple container (even though you can use ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'AnimatedContainer',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: '). Lets put a container in the center of the screen and make it red like below.'),
                    ],
                  ),
                ),
                const Divider(thickness: 3),
                const FittedBox(
                  child: Text('''@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ),
      ),
    );
  }
'''),
                ),
                const Divider(thickness: 3),

                RichText(
                  text: const TextSpan(
                    text: 'Now. We know that the ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'growAnimation',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: ' value changes every frame so we want to use that for the width and the height.'),
                    ],
                  ),
                ),
                const Divider(thickness: 3),
                const FittedBox(
                  child: Text('''@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Container(
        height: growAnimation.value,
        width: growAnimation.value,
        color: Colors.red,
      ),
    ),
  );
}
'''),
                ),
                const Divider(thickness: 3),
                const Text('No every frame we’ll have a different value for width and height, so we’ll create the illusion of movement. Which is exactly what an animation is. An object drawn at a different place every frame to give the illusion of movement. The code above will not show the animation yet. Now you have to make sure the widget is rebuilt with the new values everyframe and that we can do with a setState call. Remember where we added a listener above, well we can now replace that print statement with a setState call.'),
                const Divider(thickness: 3),
                const FittedBox(
                  child: Text('''controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..addListener(() {
            setState((){});
          });
'''),
                ),
                const Text('And that’s your fist basic animation 😁 Well Done 🎉🎉'),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MaterialButton(
                    onPressed: () => _animation(context,0),
                    color: CupertinoColors.systemIndigo,
                    minWidth: MediaQuery.of(context).size.width,
                    height: 55,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('Result', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
                  ),
                ),






              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                const Divider(thickness: 3),
                RichText(
                  text: const TextSpan(
                    text: 'Flutter provides us with a way to take some of the boiler plate away by putting the part that animates into its own widget using an AnimatedWidget as the base class. We’ll create a new class that extends the ',
                    style: TextStyle(color: Colors.black),
                    // style:  TextStyle(color: CupertinoColors.systemGreen, fontSize: 22, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'AnimatedWidget',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: ' class. It will take in a '),
                      TextSpan(
                        text: 'AnimationController',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: ' called controller. The animation will be set through the super call to the listenable property. The AnimatedWidget is a stateless widget that listens to the '),
                      TextSpan(
                        text: 'Listenable',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: ' through a listener and calls set setState for us. So all we have to do is get the animation in the build function and use its value for the width and height of our container. It will get rebuilt whenever the value has changed.'),
                    ],
                  ),
                ),
                const Divider(thickness: 3),
                const FittedBox(
                  child: Text('''class GrowingContainer extends AnimatedWidget {
  GrowingContainer({AnimationController controller}) 
            : super(listenable: Tween<double>(begin: 0, end: 200).animate(controller));
  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Container(
      height: animation.value,
      width: animation.value,
      color: Colors.red,
    );
  }
}
'''),
                ),
                const Divider(thickness: 3),
                RichText(
                  text: const TextSpan(
                    text: 'Now in the ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'HomeView',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: '  we can go ahead and remove the listener we added and take out the setState call. We can also remove the growAnimation leaving only this in the '),
                      TextSpan(
                        text: 'initState',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 3),
                /// initState
                const FittedBox(
                  child: Text('''@override
void initState() {
  super.initState();
  controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
  controller.forward();
}
'''),
                ),
                const Divider(thickness: 3),
                const Text('Then the build function we can now update to make use of the GrowingContainer we created above.'),
                const Divider(thickness: 3),
                const FittedBox(
                  child: Text('''Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
        child: GrowingContainer(
      controller: controller,
    )),
  );
}
'''),
                ),
                const Divider(thickness: 3),
                RichText(
                  text: const TextSpan(
                    text: 'It’s a bit less code and “hides” the animation/tween code in the widget itself. You can wrap all of this in the Container as well which would be perfectly fine. Make it a stateful widget give it a SingleTickerMixinState and have all your code in there. That’s exactly what the ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'AnimatedContainer',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: ' is. I won\'t go into details about that because it "hides" all the animation logic from you and I\'m trying to show you how to manually setup animations.\n'),
                      TextSpan(text: '\nThe basics of '),
                      TextSpan(
                        text: 'AnimatedWidget',
                        style:  TextStyle(color: CupertinoColors.systemRed),
                      ),
                      TextSpan(text: ' are as follows. You use it in a stateful widget and give it a duration. When you call setState and a value have changed, say for instance your width. Instead of re-rendering the container at the new width it will animate using the duration you defined until it reaches the new state.'),
                    ],
                  ),
                ),
                const Divider(thickness: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MaterialButton(
                    onPressed: () => _animation(context,0),
                    color: CupertinoColors.systemIndigo,
                    minWidth: MediaQuery.of(context).size.width,
                    height: 55,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('Result', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
