import 'package:flutter/material.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Page Not Found")
      ),
      body: Center(
        child: Text(
          "Page under construction...",
          style: TextStyle(
            fontSize: 22,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2
          ),
        ),
      )
    );
  }
}