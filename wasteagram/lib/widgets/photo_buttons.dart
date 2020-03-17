import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/new_entry.dart';

class PhotoButtons extends StatelessWidget {

  final post;
  final stateChanger;
  
  PhotoButtons({Key key, this.post, this.stateChanger});

  @override
  Widget build(BuildContext context) {
    if(post.image == null) {
      return initialButtons();
    } else {
      return imageSelectedButtons(context);
    }
  }
  
  Widget initialButtons() {
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Select a Photo"),
              onPressed: () {
                getImage(exists: true);
              }
            ),
            RaisedButton(
              child: Text("Take a Photo"),
              onPressed: () {
                getImage(exists: false);
              }
            ),
          ],
        )
      );
  }

Widget imageSelectedButtons(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget> [ 
      RaisedButton(
        color: Colors.grey,
        child: Text("Change Photo", style: TextStyle(color: Colors.white)),
        onPressed: () {
        post.image = null;
        stateChanger();
      },),
      SizedBox(width: 40),
      RaisedButton(
        color: Colors.blue,
        child: Text("Use Photo", style: TextStyle(color: Colors.white)),
        onPressed: () {Navigator.pushNamed(context, NewEntry.path, arguments: post);},)
    ]);
  }


  void getImage({@required bool exists}) async {
    exists == true ? 
      post.image = await ImagePicker.pickImage(source: ImageSource.gallery) :
      post.image = await ImagePicker.pickImage(source: ImageSource.camera);

    stateChanger();
  }
}