// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget contactItem({
      required IconData ic,
      required String detail
    }){
      return Column(
        children: [
          Icon(
            ic,
            size: 26,
            color: Colors.white,
          ),
          SizedBox(height: 15,),
          Text(
            detail,
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ]
      );
    }

    Widget contactForm(){
      return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email"
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email cannot be empty";
                } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Your Email',
              ),
            ),
            SizedBox(height: 10,),
            // Text(
            //   "Subject"
            // ),
            // TextFormField(
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return "Please enter subject of query";
            //     }
            //     return null;
            //   },
            //   decoration: InputDecoration(
            //     hintText: 'Subject of your query',
            //   ),
            // ),
            SizedBox(height: 10,),
            Text(
              "Message"
            ),
            TextFormField(
              maxLines: 4,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a message";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Your message',
              ),
            ),
          ],
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Colors.deepPurple.shade900,
                  padding: EdgeInsets.only(top: 25),
                  height: height * 0.5,
                  width: width,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Get In Touch",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 240, 234, 234),
                            letterSpacing: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          contactItem(ic: Icons.phone, detail: "+91 90077 28628"),
                          contactItem(ic: Icons.alternate_email, detail: "dheesree,info@gmail.com"),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          contactItem(ic: Icons.apartment, detail: "123 Street, DumDum, Kolkata"),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: height * 0.40,
                  left: width * 0.1,
                  child: Container(
                    height: height * 0.36,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(15),
                    child: contactForm(),
                  ),
                ),
                Positioned(
                  top: height * 0.73,
                  left: width * 0.5,
                  child: Icon(
                    Icons.send,
                    size: 40,
                    color: Colors.deepPurple.shade800,
                  ),
                ),
                Positioned(
                  top: height * 0.8,
                  left: width * 0.1,
                  child: Container(
                    height: 50,
                    width: width * 0.8,
                    color: Colors.redAccent,
                  ),
                )
              ]
            ),
          ],
        ),
      ),
    );
  }
}