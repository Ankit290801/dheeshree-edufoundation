// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final _formkey = GlobalKey<FormState>();

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
      return Column(
        children: [
          Row(
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
                  height: 45,
                  width: 45,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1.1
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email cannot be empty";
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Your Email',
                    ),
                    enabled: true,
                  ),
                  SizedBox(height: 15,),
                  Text(
                    "Message",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1.1
                    ),
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
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: (){
                        if(_formkey.currentState!.validate()){
                          Fluttertoast.showToast(  
                            msg: 'Feedback submitted successfully',  
                            toastLength: Toast.LENGTH_SHORT,  
                            gravity: ToastGravity.BOTTOM,  
                            backgroundColor: Colors.lightGreen,  
                            textColor: Colors.white  
                          );  
                          Navigator.pop(context);
                        }
                      },
                      child: Image.asset(
                        'assets/send.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
            // Stack(
            //   clipBehavior: Clip.none,
            //   children: [
            //     Container(
            //       color: Colors.deepPurple.shade900,
            //       padding: EdgeInsets.only(top: 25),
            //       height: height * 0.5,
            //       width: width,
            //       child: Column(
            //         children: [
            //           Align(
            //             alignment: Alignment.topCenter,
            //             child: Text(
            //               "Get In Touch",
            //               style: TextStyle(
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.w700,
            //                 color: Color.fromARGB(255, 240, 234, 234),
            //                 letterSpacing: 1.3
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 30,),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               contactItem(ic: Icons.phone, detail: "+91 90077 28628"),
            //               contactItem(ic: Icons.alternate_email, detail: "dheesree,info@gmail.com"),
            //             ],
            //           ),
            //           SizedBox(height: 30,),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               contactItem(ic: Icons.apartment, detail: "123 Street, DumDum, Kolkata"),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //     Positioned(
            //       top: height * 0.40,
            //       left: width * 0.1,
            //       child: Container(
            //         height: height * 0.4,
            //         width: width * 0.8,
            //         decoration: BoxDecoration(
            //           color: Color.fromARGB(255, 245, 245, 245),
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         padding: EdgeInsets.all(15),
            //         child: contactForm(),
            //       ),
            //     ),
            //     Positioned(
            //       top: height * 0.77,
            //       left: width * 0.45,
            //       child: Image.asset(
            //         'assets/send.png',
            //         height: 40,
            //         width: 40,
            //       )
            //     ),
            //   ]
            // ),
          
            Container(
              color: Colors.deepPurple.shade900,
              padding: EdgeInsets.only(bottom: 20),
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
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      contactItem(ic: Icons.apartment, detail: "123 Street, DumDum, Kolkata"),
                    ],
                  )
                ],
              ),
            ),
            Container(
              // height: height * 0.4,
              // width: width * 0.8,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(15),
              child: contactForm(),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}