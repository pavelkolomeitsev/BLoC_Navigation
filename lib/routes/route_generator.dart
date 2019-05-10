import 'package:flutter/material.dart';

import '../bloc_provider/bloc_provider.dart';
import '../home_page/home_page_bloc.dart';
import '../home_page/home_page_ui.dart';
import '../second_page/second_page_ui.dart';
import '../error_page/error_page_ui.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings){

    // settings is an object which consists of name, arguments and so on
    final args = settings.arguments;

    // compare name of settings (name of route)
    switch(settings.name){

      // home page
      case '/':
        return new MaterialPageRoute(builder: (_){
          BlocProvider<HomePageBloc>(
              child: new HomePage(),
              bloc: new HomePageBloc());
        });

      case '/second':
        // check arguments for correctness
        if(args is String){
          return new MaterialPageRoute(builder: (_) => new SecondPage(luckyNumber: args));
        }
        // else it returns an error page
        return new MaterialPageRoute(builder: (_) => new ErrorPage());

      default:
        return new MaterialPageRoute(builder: (_) => new ErrorPage());
    }
  }
}