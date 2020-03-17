import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/post.dart';


class NewEntry extends StatefulWidget {

  static const path = 'newEntry';
  final Post post;
  

  NewEntry({Key key, this.post}) : super(key: key);
  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Wasteagram"),
      ),
      body: Column(children: <Widget> [
        Flexible(flex: 3, fit: FlexFit.tight, child: showImage()),
          Flexible(
              flex: 6,
                      child: Form(
              key: formKey,
              child: Column(children: <Widget> [
                Flexible(flex: 3, fit: FlexFit.tight, child: entryField()),
                Flexible(flex: 1, fit: FlexFit.tight,child: formButton(),),]
                )
        ),
          )]
      ),
    );
  }

  void returnHome() {
    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
  }

  Widget showImage() {
    return  Container (
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(widget.post.image), 
          fit: BoxFit.cover
        ),        
      ),
    );
  }

  Widget entryField() {
    return Padding(
        padding: const EdgeInsets.only(left: 64, right: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(fit: FlexFit.loose, child: Text("Waste Items", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),),
            Flexible(child: FractionallySizedBox(heightFactor: .2)),
            Flexible(fit: FlexFit.loose,
              child: TextFormField(
                autofocus: false, 
                decoration: InputDecoration(labelText: "Amount", border: OutlineInputBorder(),),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  widget.post.wasteCount = int.parse(value);
                },
                validator: (value) { return isValid(value: value); },
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly]
              ),
            ),
          ],
        ),
    );
  }

  Widget formButton() {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      child: RaisedButton(
        child: Icon(Icons.cloud_upload, color: Colors.white, size: 72),
        onPressed: () {
          pressedSave();
        },
        color: Colors.blue,
      ),
    );
  }

  String isValid({value}) {
    if (value.isEmpty) {
      return "Please enter an amount";
    } else {
      return null;
    }
  }

  void pressedSave() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      widget.post.postToCloud('posts');
      returnHome();
    }
  }
}