import 'package:flutter/material.dart';
import '../widgets/photo_buttons.dart';
import '../models/post.dart';

class PhotoScreen extends StatefulWidget {

  static const path = 'photo';
  final title = 'Wasteagram';
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {

  final Post post = Post();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: photoButtons(),
    );
  }

  Widget photoButtons() {
    if(post.image == null) {
      return PhotoButtons(post: post, stateChanger: setImageState);
    } else {
      return Column(children: <Widget>[
        Flexible(flex: 4, child: showImage()),
        Flexible(flex: 1, child: Container(alignment:Alignment.center, child: PhotoButtons(post: post, stateChanger: setImageState)))
      ],);
    }
  }

  setImageState() {
    setState(() {});
  }

  Widget showImage() {
    return Container (
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(post.image), 
          fit: BoxFit.cover
        ),        
      ),
    );
  }
}