// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:edufoundation_app/screens/navDrawer.dart';
import 'package:edufoundation_app/screens/subjectChapters.dart';
import 'package:flutter/material.dart';

import '../constants/route_constants.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget star = Icon(Icons.star);
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 77, 136),
        foregroundColor: Colors.grey.shade50,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Home',
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: Color(0xff5072a7),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(100)),
              ),
              child: Center(
                child: Text(
                  "Aspire \u2022 Assimilate \u2022 Achieve",
                  style: TextStyle(
                    color: Colors.grey.shade50,
                    fontSize: 20,
                    letterSpacing: 1.4,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(
                      subjectChapters, 
                      arguments: "Physics"
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 180, 17, 120),
                    ),
                    height: 175,
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage('assets/physics_icon.png'),
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Physics",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(
                      subjectChapters, 
                      arguments: "Chemistry"
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red[800],
                    ),
                    height: 175,
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage('assets/chemistry_icon.png'),
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Chemistry",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(
                      subjectChapters, 
                      arguments: "Mathematics"
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[800],
                    ),
                    height: 175,
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage('assets/maths_icon.png'),
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Maths",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(
                      subjectChapters, 
                      arguments: "Biology"
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green[800],
                    ),
                    height: 175,
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage('assets/bio_icon.png'),
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Biology",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
