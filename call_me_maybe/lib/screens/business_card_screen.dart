import 'package:flutter/material.dart';
import '../Components/BusinessCard/content.dart';

class BusinessCardPage extends StatelessWidget {

  const BusinessCardPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Center(child: BusinessCardContent(), );
  }
}
