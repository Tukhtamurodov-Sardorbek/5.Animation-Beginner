import 'package:flutter/material.dart';

class HeroAnimations extends StatefulWidget {
  const HeroAnimations({Key? key}) : super(key: key);
  static const String id = 'hero_animations';

  @override
  _HeroAnimationsState createState() => _HeroAnimationsState();
}
List images = [
  'assets/profile_pictures/boys/boy1.jpg',
  'assets/profile_pictures/girls/girl1.jpg',
  'assets/profile_pictures/boys/boy12.jpg',
  'assets/profile_pictures/girls/girl12.jpg',
  'assets/profile_pictures/boys/boy11.jpg',
  'assets/profile_pictures/girls/girl11.jpg'
];
class _HeroAnimationsState extends State<HeroAnimations> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index){
          return ListTiles(images[index], index+1);
        },
      ),
    );
  }

  Widget ListTiles(String image, int i){
    return ListTile(
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Details(image: images[i-1])),
        );
      },
      tileColor: Colors.accents[i % Colors.accents.length],
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Hero(
            tag: 'location-img-$image',
            child: Image.asset(image, height: 50)
        ),
      ),
      title: Text('Image #$i'),
    );
  }
}

class Details extends StatelessWidget {
  static const String id ='details';

  final String image;
  const Details({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              child: Hero(
                  tag: 'location-img-$image',
                  child: Image.asset(image, height: 360, fit: BoxFit.cover, alignment: Alignment.topCenter)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
