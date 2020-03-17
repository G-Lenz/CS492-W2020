import 'package:flutter/material.dart';
import '../widgets/Details.dart';

class DetailsScreen extends StatefulWidget {
  static const path = 'details';
  final post;

  DetailsScreen({Key key, this.post}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wasteagram"),
      ),
      body: Container(width: MediaQuery.of(context).size.width, child: Details(post: widget.post)),

    );
  }
}