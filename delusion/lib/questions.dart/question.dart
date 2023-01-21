import 'package:delusion/database/consts.dart';
import 'package:delusion/database/localdb.dart';
import 'package:delusion/predict/predict.dart';
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

int n = 0;

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Text(
                que_data[n]['questions'].toString(),
                style: const TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 5, 234, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 5, 234, 255),
                border: Border.all(style: BorderStyle.none),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        user_input.add(0);
                        setState(() {
                          next(context);
                        });
                      },
                      child: const Text(
                        "Definetly Agree",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 5, 234, 255),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        user_input.add(1);
                        setState(() {
                          next(context);
                        });
                      },
                      child: const Text(
                        "Slightly Agree",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 5, 234, 255),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        user_input.add(2);
                        setState(() {
                          next(context);
                        });
                      },
                      child: const Text(
                        "Slightly Disagree",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 5, 234, 255),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        user_input.add(3);
                        setState(() {
                          next(context);
                        });
                      },
                      child: const Text(
                        "Definetly Disagree",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 5, 234, 255),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

next(context) {
  if (n < 20) {
    n++;
  } else {
    getPrediction(user_input);
    Navigator.pushNamed(context, '/result');
  }
}
