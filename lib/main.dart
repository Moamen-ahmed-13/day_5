import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  stops: [0.3, 0.9],
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.3),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          cardWidget(
                            image: 'assets/images/place.jpg',
                            title: 'Sedona',
                          ),
                          cardWidget(
                            image: 'assets/images/place2.jpg',
                            title: 'Golde Gate Bridge',
                          ),
                          cardWidget(
                            image: 'assets/images/place3.jpg',
                            title: 'Grand Canyon',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          pointWidget(
            top: 100.0,
            left: 150.0,
          ),
          pointWidget(
            top: 150.0,
            left: 50.0,
          ),
          pointWidget(
            top: 300.0,
            left: 200.0,
          ),
        ],
      ),
    );
  }

  cardWidget({image, title}) {
    return AspectRatio(
      aspectRatio: 1.9 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.shade300,
                    ),
                    child: Center(
                      child: Text(
                        '2.1 mi',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.star_border_outlined,
                  color: Colors.amber,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pointWidget({top, left}) {
    return Positioned(
      top: top,
      left: left,
      child: AvatarGlow(
        glowColor: Colors.blue,
        child: Icon(
          Icons.location_on,
          color: Colors.blue,
        ),
      ),
    );
  }
}
