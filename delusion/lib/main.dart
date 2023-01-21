import 'dart:async';

import 'package:delusion/database/consts.dart';
import 'package:delusion/database/localdb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'screens/splash_screen.dart';
import 'package:delusion/routes/routes.dart';

void main() async {
  que_data = await getTableData(localTable);
  if (que_data.isEmpty) {
    await insertData();
  } else {
    print(que_data);
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: Splash(),
        title: new Text(
          'Delusion',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 50.0, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        image: Image.asset('assets/images/splash.gif'),
        photoSize: 150,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }
}

// ignore: camel_case_types
class First_Page extends StatelessWidget {
  const First_Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // initState();
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(),
            Center(
              child: InkWell(
                child: Text(
                  "Delusion",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                onDoubleTap: () => Navigator.pushNamed(context, '/splash'),
              ),
            ),
            Container(),
            Container(
              color: Colors.blue,
              child: Image.asset('assets/images/splash.gif'),
              height: 300,
              width: 300,
            )
          ],
        ),
      ),
    );
  }
}
