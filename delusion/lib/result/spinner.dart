import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatefulWidget {
  Spinner({Key? key}) : super(key: key);

  @override
  State<Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(children: [
        SpinKitSquareCircle(
          color: Color.fromARGB(255, 5, 234, 255),
          size: 50.0,
          controller: AnimationController(
              vsync: this, duration: const Duration(milliseconds: 1200)),
        ),
        Center(
          child: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 6, 103, 182),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 6, 103, 182),
                width: 3,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ]),
    );
  }
}
