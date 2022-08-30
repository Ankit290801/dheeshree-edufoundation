// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/route_constants.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    /**
     * !! to use our new [AppRouter class]
     * !! 1. use the [Navigator.of(context).pushNamed(route_constant)]
     */
    Navigator.of(context).pushReplacementNamed(home);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    double fontsize;
    double spinsize;

    width < 385 ? {
      fontsize = 30,
      spinsize = 40
     } : {
      fontsize = 40,
      spinsize = 50
     };

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/splash_background.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.3),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'EduFoundation',
                style: TextStyle(
                  fontSize: fontsize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 20,),
              SpinKitFadingCircle(
                color: Colors.white,
                size: spinsize,
              )
            ],
          ),
        ),
      ),
    );
  }
}
