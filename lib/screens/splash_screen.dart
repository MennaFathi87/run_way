import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runaway/screens/home_screen.dart';

import 'package:runaway/widgets/animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = 'spalshpage';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 800), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('asssets/splash/Runway.png'),
              width: 188,
            ),
          ),
          //sizedbox
          const Gap(10),
          AnimationLine()
        ],
      ),
    );
  }
}
