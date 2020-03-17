import 'package:flutter/material.dart';
import 'screens/list_screen.dart';
import 'screens/photo_screen.dart';
import 'screens/new_entry.dart';
import 'screens/details_screen.dart';


class MyApp extends StatelessWidget {

  final routes = {
    MyHomePage.path: (context) => MyHomePage(),
    PhotoScreen.path: (context) => PhotoScreen(),
    NewEntry.path: (context) =>
                NewEntry(post: ModalRoute.of(context).settings.arguments),
    DetailsScreen.path: (context) => DetailsScreen(post: ModalRoute.of(context).settings.arguments),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}

