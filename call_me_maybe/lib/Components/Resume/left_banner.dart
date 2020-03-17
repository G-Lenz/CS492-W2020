import 'package:flutter/material.dart';

class LeftBanner extends StatelessWidget {
  
  LeftBanner({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
        color: Color(0xff4a99da)
          ),
          child: Column(
          children: <Widget>[
            image("https://si.wsj.net/public/resources/images/ED-AX322_Kessle_M_20180309114331.jpg"),
            showPortrait(context: context,
              flex: 3, 
              child: Column(children: <Widget> [
                section(
                  title: "About Me",
                  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
               ),
               section(
                title: "Skills",
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
              ),
              ]),
            ),
          ],)
      ),
    );
  } //build

  Widget image(url) {
    return Expanded(
      flex: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(url)
            )
          ),
        ),
    );
  } //image() 

  Widget section({title, content}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
          children: <Widget>[
            Text(title, 
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'Garamond'
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content,
                style: TextStyle(color: Colors.white )),
            )
            ],
          ),
    );
  } //section()

  Widget showPortrait({child, flex, context}) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return Container(width: 0, height: 0);
    }
    else {
      return Expanded(flex: flex, child: child);
    }

  }
} //class 