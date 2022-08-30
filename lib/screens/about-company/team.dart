import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget buildTeamCard({required String name, required String pos, required String img}){
      return Container(
        height: 300,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 40, 10, 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 200,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 218, 218),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 94, 92, 92),
                    blurRadius: 7.0, // soften the shadow
                    spreadRadius: 0.5, //extend the shadow
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1
                    ),
                  ),
                  Text(
                    pos,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.1
                    ),
                  ),
                  Spacer(),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    height: 50,
                    width: width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Image.asset(
                            'assets/facebook.png',
                            height: 40,
                            width: 40,
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Image.asset(
                            'assets/whatsapp.png',
                            height: 40,
                            width: 40,
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Image.asset(
                            'assets/instagram.png',
                            height: 46,
                            width: 46,
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Image.asset(
                            'assets/linkedin.png',
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: width * 0.32,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 199, 202, 199),
                radius: 60,
                child: Image.asset(
                  img,
                  height: 110,
                  width: 110,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Meet the Team',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: Color.fromARGB(255, 240, 238, 238),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              buildTeamCard(name: "Surajit Mandal", pos: "CEO", img: 'assets/surajit.png'),
              SizedBox(height: 20,),
              buildTeamCard(name: "Ankit Banerjee", pos: "App Developer", img: 'assets/ankit.png'),
              SizedBox(height: 20,),
              buildTeamCard(name: "Arko Sen", pos: "Front-end Web Developer", img: 'assets/arko.png'),
              SizedBox(height: 20,),
              buildTeamCard(name: "Bhaskar Sengupta", pos: "Back-end Developer", img: 'assets/bhaskar.png'),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}