import 'package:flutter/material.dart';

// Interface for all Blocs
abstract class BlocBase{
  void dispose();
}

// Generic BLoC Provider
class BlocProvider<T extends BlocBase> extends StatefulWidget{

  final Widget child; // a reference for a page
  final T bloc; // a reference for business logic class

  // named optional constructor
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  @override
  _BlocProviderState<T> createState() => new _BlocProviderState();

  static T of<T extends BlocBase>(BuildContext context){

    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;

}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>>{

  @override
  void dispose(){
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}