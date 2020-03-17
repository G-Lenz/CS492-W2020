import 'package:flutter/material.dart';
import '../widgets/list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './photo_screen.dart';

class MyHomePage extends StatefulWidget {

  static const path = '/';
  final String title = "Wasteagram";



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  int total = 0;

  @override
  void initState() {
    super.initState();
    updateTotal();
  }

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: titleBar(title: widget.title),
      ),
      body: WasteList(),
      floatingActionButton: FloatingActionButton(
        
        child: Icon(Icons.add),
        onPressed: () { Navigator.pushNamed(context, PhotoScreen.path);},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget titleBar({@required title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title + " - " + total.toString()),
    ],);
  }
  
  
  void updateTotal() async {
    Firestore.instance.collection('posts').snapshots().listen((snapshot) { 
	    snapshot.documentChanges.forEach((change){
        if (change.type == DocumentChangeType.added)
        {
          total = total + change.document['quantity'];
        } else {
          total = total - change.document['quantity'];
        }
      });
	    setState(() {});
    });   
  }
}


