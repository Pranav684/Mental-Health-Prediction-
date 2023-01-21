import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Container(
            height: 440,
            width: 340,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 5, 234, 255),
                border: Border.all(style: BorderStyle.none),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Age",
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Gender",
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/question');
                  },
                  child: Text(
                    "Proceed",
                    style: TextStyle(color: Color.fromARGB(255, 5, 234, 255)),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
