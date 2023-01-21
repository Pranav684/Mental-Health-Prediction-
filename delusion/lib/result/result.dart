import 'package:delusion/database/consts.dart';
import 'package:delusion/predict/predict.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

double i = 1;
Color c = Color.fromARGB(255, 5, 234, 255);
List<Color> c_list = [Colors.blue, Colors.green, Colors.yellow, Colors.red];
int j = 0;

class _ResultState extends State<Result> with TickerProviderStateMixin {
  @override
  wait_fun() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (predicted_result != '') {
        setState(() {
          if (predicted_result == "Mild") {
            i = 4;
            c = Colors.green;
          } else if (predicted_result == 'None') {
            predicted_result = 'Low';
            i = 2;
            c = const Color.fromARGB(255, 5, 234, 255);
          } else if (predicted_result == 'Moderate') {
            i = 6;
            c = Colors.yellow;
          } else if (predicted_result == 'High') {
            i = 8;
            c = Colors.orange;
          } else if (predicted_result == 'Severe') {
            i = 10;
            c = Colors.red;
          }
        });
        // if (notResponded) Navigator.pushNamed(context, '/result');
        notResponded = false;
        return;
      } else {
        setState(() {
          c = c_list[j];
          j++;
          if (j >= 4) j = 0;
        });
        wait_fun();
      }
    });
  }

  void initState() {
    super.initState();
    wait_fun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 6, 103, 182),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (predicted_result != '')
              Container(
                padding: const EdgeInsets.only(left: 40, bottom: 140),
                child: Text(
                  "You are showing signs of $predicted_result Depression",
                  style: const TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 5, 234, 255)),
                ),
              ),
            // SizedBox(
            //   height: 100,
            // ),
            // predicted_result != ''
            //     ?
            Container(
              padding: EdgeInsets.all(30),
              child: AnimatedScale(
                duration: Duration(seconds: 2),
                scale: i,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: c,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ),
              // Text(
              //   "You have a $predicted_result level of Depression",
              //   style: const TextStyle(
              //       fontSize: 35,
              //       color: Color.fromARGB(255, 5, 234, 255)),
              // ),
            )
          ],
        )
            // : Stack(children: [
            //     SpinKitSquareCircle(
            //       color: Color.fromARGB(255, 5, 234, 255),
            //       size: 50.0,
            //       controller: AnimationController(
            //           vsync: this,
            //           duration: const Duration(milliseconds: 1200)),
            //     ),
            //     Center(
            //       child: Container(
            //         height: 10,
            //         width: 10,
            //         decoration: const BoxDecoration(
            //           color: Color.fromARGB(255, 6, 103, 182),
            //           borderRadius: BorderRadius.all(Radius.circular(20)),
            //         ),
            //       ),
            //     ),
            //     Center(
            //       child: Container(
            //         height: 46,
            //         width: 46,
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: Color.fromARGB(255, 6, 103, 182),
            //             width: 3,
            //           ),
            //           borderRadius: BorderRadius.all(Radius.circular(20)),
            //         ),
            //       ),
            //     ),
            //   ])
            ),
      ),
    );
  }
}
