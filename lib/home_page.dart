import 'package:flutter/material.dart';

import 'concepts/1.Basics.dart';
import 'classes/1.Basic.dart';
import 'examples/1.Built-in Animations.dart';
import 'examples/2.Tween.dart';
import 'examples/3.Hero.dart';
import 'examples/4.Controllers.dart';
import 'examples/5.Curves.dart';
import 'examples/6.AnimatedList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, String> concepts = {
    Basics.id: 'BASICS',
    BuiltInAnimation.id: 'Built In Animation'.toUpperCase(),
    TweenAnimations.id: 'Tween Animations'.toUpperCase(),
    HeroAnimations.id: 'Hero Animations'.toUpperCase(),
    AnimationsController.id: 'Animation Controllers'.toUpperCase(),
    CurvedAnimations.id: 'Curves'.toUpperCase(),
    AnimatedLists.id: 'Animated List'.toUpperCase(),
  };
  // Map<String,String> tasks = {
  //   Task1.id : 'First Task',
  //   Task1Result.id : 'First Task Result',
  //   Task2.id : 'Second Task',
  //   Task2Result.id : 'Second Task Result',
  //   Task3.id : 'Third Task',
  //   Task3Result.id : 'Third Task Result'
  // };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Animations Beginner'),
          centerTitle: true,
          bottom: const TabBar(
              indicatorColor: Colors.cyan,
              labelColor: Colors.cyan,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                    icon: Icon(Icons.menu_book, color: Colors.cyan),
                    text: 'Concepts',
                    height: 50),
                Tab(
                    icon: Icon(Icons.task, color: Colors.cyan),
                    text: 'Tasks',
                    height: 50),
              ]),
        ),
        body: TabBarView(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: concepts.length,
              itemBuilder: (context, index) {
                return _card(index + 1, concepts.values.toList()[index],
                    concepts.keys.toList()[index]);
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: concepts.length,
              itemBuilder: (context, index) {
                return _card(index + 1, concepts.values.toList()[index],
                    concepts.keys.toList()[index]);
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget _card(int number, String name, String id) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(id);
        },
        contentPadding: const EdgeInsets.all(0),
        minVerticalPadding: 10,
        minLeadingWidth: 10,
        leading: Text(number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        title: Center(
            child: Text(name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, letterSpacing: 1.5),
                textAlign: TextAlign.center)),
        selectedColor: Colors.blueGrey,
      ),
      elevation: 10.0,
    );
  }
}
