import 'package:flutter/material.dart';

import '../bloc_provider/bloc_provider.dart';
import './home_page_bloc.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // a reference for a bloc component
    final HomePageBloc bloc = BlocProvider.of<HomePageBloc>(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home Page'),
      ),
      backgroundColor: Colors.green[700],
      body: new Center(
        child: new Text(
          'What is your lucky number?',
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(
            Icons.arrow_forward,
            size: 35.0,
          ),
          onPressed: (){
            // to run a clickOnFAB stream, it triggers running homePageLogic() function and run the luckyNumber stream
            //bloc.generateLuckyNumber.add(null);
            // to take a value from the luckyNumber stream and pass it as an argument to another page by helping a Navigator
            Navigator.of(context).pushNamed('/second', arguments: bloc.getLuckyNumber());
          }),
    );
  }
}
