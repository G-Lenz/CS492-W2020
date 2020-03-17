import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  final post;

  Details({Key key, this.post}) : super (key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
      Flexible(flex: 1, fit:FlexFit.tight, child: displayDate()),
      Flexible(flex: 5, fit: FlexFit.tight, child: displayImage()),
      Flexible(flex: 1, fit: FlexFit.tight, child: displayItemCount()),
      Flexible(flex:1, fit: FlexFit.tight, child: displayLocation()),
      Flexible(flex: 2, fit: FlexFit.tight, child: FractionallySizedBox(heightFactor: 1))

    ],
    );
  }

  Widget displayDate() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(formatDate(widget.post['date']),
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }

  Widget displayImage() {
    return Image.network(widget.post['imageURL']);
  }

  Widget displayItemCount() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text("Items: " + widget.post['quantity'].toString(),
        style: TextStyle(fontSize: 24)
      ),
    );
  }

  Widget displayLocation() {
    return Text("(${widget.post['latitude'].toString()}, ${widget.post['longitude'].toString()})",
      style: TextStyle(fontSize: 20)
    );

  }

    static String formatDate(firestoreDate) {
    var formatter = DateFormat('EEEE, MMMM d, y');
    return formatter.format(firestoreDate.toDate());
  }
}