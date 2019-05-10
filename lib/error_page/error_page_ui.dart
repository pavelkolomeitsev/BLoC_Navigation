import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Error Page'),
      ),
      body: new Center(
        child: new Text('404'),
      ),
    );
  }
}