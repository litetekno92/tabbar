import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabbar/fetchdata.dart';
import 'package:tabbar/fetchdatacat.dart';
import 'package:tabbar/models/category.dart';


class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end:
              Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: [
            const Color(0xFFFFFFEE),
            const Color(0xFF999999)
          ], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        )),
        child: Container(
            child: Column(
          children: <Widget>[
            Material(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                elevation: 10,
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('images/mediasen-logo.png',
                        width: 92, height: 92))),
            Text('LeMedia.sn',
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ],
        )),
      ),

      // CustomListTile(Icons.home, 'Home', () => {}),
      // CustomListTile(Icons.person, 'Profile', () => {}),
      // CustomListTile(Icons.settings, 'Settings', () => {}),

      CustomListTile(
          icon: categories[0].icon,
          text: categories[0].title,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => FetchData()));
          }),
      CustomListTile(
          icon: categories[1].icon, text: categories[1].title, onTap: () => {}),
      CustomListTile(
          icon: categories[2].icon, text: categories[2].title, onTap: () => {}),
      // CustomListTile(
      //     icon: categories[3].icon, text: categories[3].title, onTap: () => {}),
       CustomListTile(
          icon: categories[3].icon,
          text: categories[3].title,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => FetchDataCat(6)));
          }),
      // CustomListTile(
      //     icon: categories[4].icon, text: categories[4].title, onTap: () {
      //       Navigator.of(context).pop();
      //       Navigator.of(context).push(MaterialPageRoute(
      //           builder: (BuildContext context) => FetchDataCat(category:6)));
      //     }),
      CustomListTile(
          icon: categories[4].icon, text: categories[4].title, onTap: () => {}),
      CustomListTile(
          icon: categories[5].icon, text: categories[5].title, onTap: () => {}),
   
      CustomListTile(icon: Icons.person, text: 'PROFILE',  onTap: () => {}),
      CustomListTile(icon: Icons.settings, text: 'PARAMÈTRES', onTap: () => {}),
    ]));
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  CustomListTile({this.icon, this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.grey.shade400,
                width: 2.0,
              )),
            ),
            child: InkWell(
              splashColor: Colors.orangeAccent,
              // When the user taps the button, show a snackbar
              onTap: onTap,
              child: Container(
                  height: 50.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(icon),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(text, style: TextStyle(fontSize: 16.0)),
                          )
                        ]),
                        Icon(Icons.arrow_right),
                      ])),
            )));
  }
}

