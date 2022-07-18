// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Mission extends StatelessWidget {
  const Mission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget buildMission({
      required String item
    }){
      return Row(
        children: [
          Transform.translate(
            offset: const Offset(-8, 0),
            child: const Text(
              '•',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              item,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1.2,
                wordSpacing: 1.1,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade900,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "What We Stand For",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 1.2
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 241, 238, 238),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Text(
                "Our Vision",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  letterSpacing: 1.2
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "To emerge as a premier coaching institute for budding Engineers and Doctors with a dream to build a better tomorrow",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.2,
                  wordSpacing: 1.1,
                ),
              ),
              SizedBox(height: 30,),
              Text(
                "Our Mission",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  letterSpacing: 1.2
                ),
              ),
              SizedBox(height: 20,),
              buildMission(item: "To provide an inspiring and conducive learning environment enabled by modern pedagogy and technology"),
              SizedBox(height: 15,),
              buildMission(item: "To foster curiosity, analytical thinking and self-confidence to excel in competitive exams"),
              SizedBox(height: 15),
              buildMission(item: "To inculcate moral and ethical values to achieve the highest level of success both as individuals and as members of society"),
            ],
          )
        ),
      ),
    );
  }
}