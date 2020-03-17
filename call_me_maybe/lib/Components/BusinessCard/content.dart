import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class BusinessCardContent extends StatelessWidget {

  BusinessCardContent({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(flex: 1, child: FractionallySizedBox(heightFactor: .25, widthFactor: 1),),
            orientationSetup(
              context: context,
              widget1: image(context),
              widget2: headers(name: "Art Vandelay", title: "Importer - Exporter")
            ),
            footer(),
          ],
        );

  }

  Widget image(context) {
    return Flexible(
      fit: FlexFit.loose,
      flex: 1,
        child: orientationSizing(context: context,
          child: Container(
              decoration: BoxDecoration(
                shape:BoxShape.circle,          
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://si.wsj.net/public/resources/images/ED-AX322_Kessle_M_20180309114331.jpg")
                )), 
              alignment: Alignment.center,
            ),
        ),
    );
  }

  Widget headers({name, title}) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
              Text(name,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),),
              Text(title,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic,)
              ),
              GestureDetector(
                onTap: () => launch('sms:5555555555'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.local_phone, size: 20.0),
                      ),
                      Text('(555)-555-5555'),
                  ],
                ),
              ),
        ],);
  }

  Widget orientationSetup({BuildContext context, Widget widget1, Widget widget2}) {
    if(MediaQuery.of(context).orientation == Orientation.landscape) {
      return Expanded(flex: 20, child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[widget1, widget2],));
    }
    else {
      return Expanded(flex: 20, child: Column(children: <Widget>[widget1, widget2],));
    }
  }

  Widget orientationSizing({child, context})
  {
    if(MediaQuery.of(context).orientation == Orientation.landscape) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: FractionallySizedBox(widthFactor: .4, heightFactor: 1, child: child),
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: FractionallySizedBox(widthFactor: .7, heightFactor: .75, child: child),
      );
    }
  }

  Widget footer() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
        child: Row(children: <Widget> [
          Expanded(
            child: GestureDetector(
              onTap: () => launch('https://github.com'),
              child: Text("github.com/architect",
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 12),
                textAlign: TextAlign.start,
              ),
            ),
          ), 
          Expanded(child: Text("A.Vandelay@example.com", 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 12
            ), 
            textAlign: TextAlign.end
          )),
        ]),
    );
  }
}