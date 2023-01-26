import 'package:flutter/material.dart';

import 'StoryPage.dart';
import 'util/StroyCircle.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  void _openStory(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryCircle(
                    function: _openStory,
                  );
                }),
          )
        ],
      ),
    );
  }
}

