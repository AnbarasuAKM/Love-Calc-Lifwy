import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    super.initState();
    navigationPage();
  }

  void navigationPage() {
    Future.delayed(Duration(seconds: 3000), () {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homescreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFF6060), Color(0xFFC829C8)]),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: AnimatedSplashScreen(
                        splash: "asset/image/4SHX.gif",
                        nextScreen: homescreen()),
                  ),

                  // Lottie.asset("asset/image/heart.mp4"),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Love Is Flowing With You',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
