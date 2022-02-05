import 'package:flutter/material.dart';

class AnimatedLists extends StatefulWidget {
  const AnimatedLists({Key? key}) : super(key: key);
  static const String id = 'animated_list';

  @override
  _AnimatedListsState createState() => _AnimatedListsState();
}

class _AnimatedListsState extends State<AnimatedLists> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation _colorAnimation;
  bool isLiked = false;
  late Animation<double> _sizeAnimation;
  late CurvedAnimation _curveAnimation;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Widget> _listTiles = [];
  List<People> people = [
    People(name: 'person 1', photo: 'assets/profile_pictures/boys/boy1.jpg'),
    People(name: 'person 2', photo: 'assets/profile_pictures/boys/boy12.jpg'),
    People(name: 'person 3', photo: 'assets/profile_pictures/girls/girl12.jpg'),
    People(name: 'person 4', photo: 'assets/profile_pictures/boys/boy11.jpg'),
    People(name: 'person 5', photo: 'assets/profile_pictures/girls/girl11.jpg'),
    People(name: 'person 6', photo: 'assets/profile_pictures/boys/boy10.jpg'),
    People(name: 'person 7', photo: 'assets/profile_pictures/girls/girl10.png'),
    People(name: 'person 8', photo: 'assets/profile_pictures/boys/boy9.jpg'),
    People(name: 'person 9', photo: 'assets/profile_pictures/girls/girl9.jpg'),
    People(name: 'person 10', photo: 'assets/profile_pictures/boys/boy8.jpg'),
    People(name: 'person 11', photo: 'assets/profile_pictures/girls/girl8.png'),
    People(name: 'person 12', photo: 'assets/profile_pictures/boys/boy7.jpg'),
    People(name: 'person 13', photo: 'assets/profile_pictures/girls/girl7.jpg'),
    People(name: 'person 14', photo: 'assets/profile_pictures/boys/boy6.jpg'),
    People(name: 'person 15', photo: 'assets/profile_pictures/girls/girl6.jpg'),
    People(name: 'person 16', photo: 'assets/profile_pictures/boys/boy5.jpg'),
    People(name: 'person 17', photo: 'assets/profile_pictures/girls/girl5.jpg'),
    People(name: 'person 18', photo: 'assets/profile_pictures/boys/boy4.jpg'),
    People(name: 'person 19', photo: 'assets/profile_pictures/girls/girl4.jpg'),
    People(name: 'person 20', photo: 'assets/profile_pictures/boys/boy3.jpg'),
  ];

  void _addPerson(){
    people.forEach((People _person) {
      _listTiles.add(_listtile(_person));
      _listKey.currentState?.insertItem(_listTiles.length - 1);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
      );
      _curveAnimation = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);
      _colorAnimation = ColorTween(
        begin: Colors.grey[400],
        end: Colors.red,
      ).animate(_curveAnimation);
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
      ).animate(_curveAnimation);
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

    /// Fire After The BUILD Method has run
    WidgetsBinding.instance?.addPostFrameCallback((_) {_addPerson();});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final Tween<Offset> _offset = Tween(begin: const Offset(1,0), end: const Offset(0,0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: TweenAnimationBuilder(
          child: const Text('This is a curved app bar', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          tween: Tween<double> (begin: 0, end: 1),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeIn,
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
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _listTiles.length,
        itemBuilder: (BuildContext context, int index, animation){
          return SlideTransition(
              position: animation.drive(_offset),
              child: _listTiles[index],
          );
        },
      )
    );
  }

  Widget _listtile(People person){
    return ListTile(
      onTap: (){},
      contentPadding: const EdgeInsets.all(25),
      tileColor: Colors.blueGrey,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: AssetImage(person.photo),
          height: 50,
        ),
      ),
      title: Text(person.name),
    );
  }
}

class People{
  late String name;
  late String photo;
  People({required this.name, required this.photo});
}