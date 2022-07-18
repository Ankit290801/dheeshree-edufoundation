import 'package:edufoundation_app/constants/route_constants.dart';

import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //method for selecting tile for navigation
    void selected(BuildContext context, int index){
      Navigator.of(context).pop();

      switch(index){
        case 0:
          Navigator.of(context).pushNamed(mission);
          break;
        case 1:
          Navigator.of(context).pushNamed(team);
          break;
        case 2:
          Navigator.of(context).pushNamed(contact);
          break;
        case 3:
          Navigator.of(context).pushNamed(about);
          break;
      }
    }

    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 230, 227, 227),
        padding: EdgeInsets.symmetric(horizontal: 1),
        child: ListView(
          children: [
            SizedBox(height: height*0.1),
            ListTile(
              leading: Icon(Icons.track_changes),
              title: Text('Mission'),
              onTap: () => selected(context, 0),
            ),
            SizedBox(height: 15,),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Meet the Team'),
              onTap: () => selected(context, 1),
            ),
            SizedBox(height: 15,),
            ListTile(
              leading: Icon(Icons.contact_support),
              title: Text('Contact Us'),
              onTap: () => selected(context, 2),
            ),
            SizedBox(height: 15,),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About Us'),
              onTap: () => selected(context, 3),
            ),
            SizedBox(height: height*0.30),
            Align(
              alignment: Alignment.center,
              child: Text(
                "version 1.0.0",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}