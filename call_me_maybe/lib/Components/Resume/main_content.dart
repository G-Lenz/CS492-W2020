import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  
  final name;

  MainContent({Key key, this.name}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      header(header: "Art Vandelay", subHeader: "Importer - Exporter"),
      //content(subHeader, content)
      sectionTitle(title: "Education", icon: Icons.school),
      section(
        title: "School 1", 
        location: "Bachelor's Degree",
        date: "2000-2010",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        ),
      section(
        title: "School 2", 
        location: "Master's Degree",
        date: "2010-2014",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        ),
      sectionTitle(title: "Experience", icon: Icons.business_center),
      section(
        title: "Job Title 1", 
        location: "Work Place 1",
        date: "02/2014-02/2016",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        ),
        section(
        title: "Job Title 2", 
        location: "Work Place 2",
        date: "02/2016-02/2018",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        ),
        section(
        title: "Job Title 3", 
        location: "Work Place 3",
        date: "02/2018-Present",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        ),

    ],);
  }

  Widget header({header, subHeader}) {
    return Column(children: <Widget>[
      Text(
        header, 
        style: TextStyle(
          color: Color(0xff4a99da), 
          fontFamily: 'Garamond', 
          fontSize: 40, 
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center
      ),
      Text(subHeader,
        style: TextStyle(
          fontFamily: 'Garamond',
          fontSize: 20,
          fontWeight: FontWeight.w700,
        )
      )
    ],);
  } // header()

  Widget sectionTitle({title, icon})
  {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: <Widget>[
          Icon(icon, size: 24, color: Color(0xff4a99da)),
          Flexible(child: FractionallySizedBox(widthFactor: .1)),
          Text(title, style: TextStyle(
            color: Color(0xff4a99da),
            fontSize: 24,
            fontFamily: 'Garamond',
            fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  } //sectionTitle

  Widget section({title, location, date, content}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(title, 
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Garamond"
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(children: <Widget> [
          Expanded(
            child: Text(location, style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: "Garamond"
            ),
            textAlign: TextAlign.left
            ),
          ),
          Expanded(
            child: Text(date, style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: "Garamond"
            ),
            textAlign: TextAlign.right
            ),
          ),
        ], ),
      ),
      Text(content, style: TextStyle(fontFamily: "Garamond")),
    ],);
  }
}

