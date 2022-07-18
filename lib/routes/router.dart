import 'package:edufoundation_app/screens/about-company/contact.dart';
import 'package:edufoundation_app/screens/about-company/about.dart';
import 'package:edufoundation_app/screens/about-company/mission.dart';
import 'package:edufoundation_app/screens/profile.dart';
import 'package:edufoundation_app/screens/subjectChapters.dart';
import 'package:edufoundation_app/screens/about-company/team.dart';
import 'package:edufoundation_app/screens/underConstruction.dart';
import 'package:flutter/material.dart';

import '../../screens/splashScreen.dart';
import '../../utils/bottomBar.dart';
import '../constants/route_constants.dart';

///
/// !! FOLLOW THIS TEMPLATE TO UPDATE YOUR ROUTES
///  * *  whenever you want to declare a new route,
///  * * do the following below.
///  !! 1. create a route constant in the new [route_constant.dart] file
///  !! 2. do not use static variables
///  !! 3. using the new route constant,
///  !! 4. create a new switch case
///  !! 5. return a material route and have that return your desired screen
///  !!
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const BottomBar());
      case subjectChapters:
        if(args is String){
          return MaterialPageRoute(
            builder: (_) => SubjectChapters(
              subjectName: args,
          ));
        }
        else {
          return _error();
        }
      case mission:
        return MaterialPageRoute(builder: (_) => Mission());
      case contact:
        return MaterialPageRoute(builder: (_) => Contact());
      case team:
        return MaterialPageRoute(builder: (_) => Team());
      case about:
        return MaterialPageRoute(builder: (_) => About());
      case underConstruction:
        return MaterialPageRoute(builder: (_) => PageUnderConstruction());
      default:
        return MaterialPageRoute(builder: (_) => const Splash());
    }
  }



  static Route<dynamic> _error() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error")
        ),
        body: Center(
          child: Text("Error in displaying page"),
        )
      );
    });
  }
}
