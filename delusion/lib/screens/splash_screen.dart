import 'package:delusion/intro/intro.dart';
import 'package:delusion/main.dart';
import "package:flutter/material.dart";
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final List<OnbordingData> list = [
    OnbordingData(
      image: AssetImage("assets/images/download.png"),
      titleText: Text(
        "Welcome To Delusion",
        style: TextStyle(color: Color.fromARGB(255, 75, 36, 251), fontSize: 30),
      ),
      descText: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          "Depression is being colorblind \nand constantly told how colorful the world is.",
          style:
              TextStyle(color: Color.fromARGB(255, 75, 36, 251), fontSize: 20),
        ),
      ),
    ),
    OnbordingData(
      image: AssetImage("assets/images/download1.png"),
      titleText: Text(
        "",
        style: TextStyle(color: Color.fromARGB(255, 75, 36, 251)),
      ),
      descText: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          "Anxiety does not empty tomorrow of its sorrows, but only empties today of its strength.",
          style:
              TextStyle(color: Color.fromARGB(255, 75, 36, 251), fontSize: 20),
        ),
      ),
    ),
    OnbordingData(
      image: AssetImage("assets/images/download2.png"),
      titleText: Text(
        "",
        style: TextStyle(color: Color.fromARGB(255, 75, 36, 251)),
      ),
      descText: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          "Be happy for this moment. This moment is your life.",
          style:
              TextStyle(color: Color.fromARGB(255, 75, 36, 251), fontSize: 20),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    /* remove the back button in the AppBar is to set automaticallyImplyLeading to false
  here we need to pass the list and the route for the next page to be opened after this. */
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 75, 36, 251),
      body: IntroScreen(
        onbordingDataList: list,
        colors: const [
          //list of colors for per pages
          Colors.black,
          Color.fromARGB(255, 75, 36, 251),
          Color.fromARGB(255, 222, 15, 0),
        ],
        pageRoute: MaterialPageRoute(
          builder: (context) => Intro(),
        ),
        nextButton: const Text(
          "NEXT",
          style: TextStyle(
            color: Color.fromARGB(255, 75, 36, 251),
          ),
        ),
        lastButton: const Text(
          "GOT IT",
          style: TextStyle(
            color: Color.fromARGB(255, 75, 36, 251),
          ),
        ),
        skipButton: const Text(
          "SKIP",
          style: TextStyle(
            color: Color.fromARGB(255, 75, 36, 251),
          ),
        ),
        selectedDotColor: Color.fromARGB(255, 88, 65, 190),
        unSelectdDotColor: Colors.grey,
      ),
    );
  }
}
