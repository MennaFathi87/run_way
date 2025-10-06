import 'package:flutter/material.dart';
import 'package:runaway/screens/catagory_screen.dart';
import 'package:runaway/screens/home_screen.dart';
import 'package:runaway/screens/product_screen.dart';
import 'package:runaway/screens/splash_screen.dart';

void main() {
  runApp(const RunAwayApp());
}

class RunAwayApp extends StatelessWidget {
  const RunAwayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        ProductDetails.id: (context) => ProductDetails(),
        CatagoryScreen.id: (context) => CatagoryScreen(),
        SplashScreen.id: (context) => SplashScreen(),
      },
      //الصفحه اللي هتبتدي بيها الاول
      initialRoute: SplashScreen.id,
    );
  }
}
