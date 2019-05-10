import 'package:flutter/material.dart';

import './routes/route_generator.dart';
import './bloc_provider/bloc_provider.dart';
import './home_page/home_page_bloc.dart';
import './home_page/home_page_ui.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'BLoC pattern + Navigation',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomePageBloc>(
          child: new HomePage(),
          bloc: new HomePageBloc()),
      onGenerateRoute: RouteGenerator.generateRoute, // a static function of a class which handles all routing in the App
    );
  }
}