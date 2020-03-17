import 'package:flutter/material.dart';
import '../Components/Predictor/answer.dart';

class PredictorPage extends StatefulWidget{

  const PredictorPage({Key key}) : super(key: key);

  @override
  _PredictorPage createState() => _PredictorPage();
}

class _PredictorPage extends State<PredictorPage> {

  final answer = Answer();
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Call Me...Maybe?", 
            style: TextStyle(
              fontSize: 48,
              color: Colors.blue,
              
            )
          ),
          GestureDetector(
            onTap: () {
              setState(() {answer.getNextAnswer();});
            },
            child: Text("Tap Here To receive an answer...", 
              style: TextStyle(fontSize: 24)
            ),
          ),
          Text(answer.currentAnswer, 
            style: TextStyle(
              fontSize: 30, 
              color: answer.color,
              fontWeight: FontWeight.bold,
              shadows: [ Shadow( blurRadius: 2, offset: Offset(-2, 2))]
            )
          )
        ],
      );
  }
}