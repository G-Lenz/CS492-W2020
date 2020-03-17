import 'package:flutter/material.dart';
import '../Components/Resume/left_banner.dart';
import '../Components/Resume/main_content.dart';

class ResumePage extends StatelessWidget {

  ResumePage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
      LeftBanner(),
      Expanded(flex: 3, child: SingleChildScrollView(child: MainContent())),
      ],
    );
  }
}