import 'package:flutter/material.dart';
import 'screens/business_card_screen.dart';
import 'screens/resume_screen.dart';
import 'screens/predictor_screen.dart';

class MainTabController extends StatelessWidget {

  final title;
  static const tabs = [Icon(Icons.person),
            Icon(Icons.description),
            Icon(Icons.help_outline)];
  
  final screens = [BusinessCardPage(), ResumePage(), PredictorPage()];

  MainTabController({Key key, this.title}) : super(key: key);

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs:tabs),
          title: Text(title),
        ),
        body: TabBarView(children: screens),
      )
    );
  }
}