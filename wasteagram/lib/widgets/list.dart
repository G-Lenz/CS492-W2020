 
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/details_screen.dart';

 class WasteList extends StatefulWidget {
   
   @override
   _WasteListState createState() => _WasteListState();
 }
 
 class _WasteListState extends State<WasteList> {

   @override
   Widget build(BuildContext context) {
      return StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (content, snapshot) {
          if (snapshot.hasData && snapshot.data.documents.length > 0) {
            return postList(snapshot);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
   }

   Widget postList(snapshot) {
     return ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, i) {
            var post = snapshot.data.documents[i];
            return GestureDetector(
              child: ListTile(
                title: Text(formatDate(post['date']), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                trailing: Text(post['quantity'].toString()),
              ),
              onTap: () {viewDetails(post: post);},
            );
          }
        );
   }

  static String formatDate(firestoreDate) {
    var formatter = DateFormat('EEEE, MMMM d, y');
    return formatter.format(firestoreDate.toDate());
  }

  void viewDetails({post}) {
    Navigator.pushNamed(context, DetailsScreen.path, arguments: post);
  }
 }

 