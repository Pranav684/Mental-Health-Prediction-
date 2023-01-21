import 'package:delusion/intro/intro.dart';
import 'package:delusion/main.dart';
import 'package:delusion/questions.dart/question.dart';
import 'package:delusion/result/result.dart';
import 'package:delusion/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/splash':
      {
        return MaterialPageRoute(builder: (context) => Splash());
      }
    case '/intro':
      {
        return MaterialPageRoute(builder: ((context) => Intro()));
      }
    case '/question':
      {
        return MaterialPageRoute(builder: ((context) => Question()));
      }
    case '/result':
      {
        return MaterialPageRoute(builder: ((context) => Result()));
      }
    default:
      {}
  }
  return MaterialPageRoute(builder: (context) => MyApp());
}
