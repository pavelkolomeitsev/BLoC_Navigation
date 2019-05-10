import 'dart:async';
import 'dart:math';

import '../bloc_provider/bloc_provider.dart';

class HomePageBloc implements BlocBase{

  // Stream to generate a luckyNumber
  StreamController _luckyNumberController = new StreamController(); // controller
  StreamSink get _inLuckyNumberStream => _luckyNumberController.sink; // a reference to put data into the stream
  Stream<String> get getOfLuckyNumberStream => _luckyNumberController.stream; // a reference to get data from the stream

  // Stream to handle a click on FAB
  StreamController _clickOnFABController = new StreamController(); // controller
  StreamSink get generateLuckyNumber => _clickOnFABController.sink; // a reference which triggers a generation of lucky number

  // constructor
  HomePageBloc(){

    _clickOnFABController.stream.listen(homePageLogic);
  }

  // all logic of home page
  void homePageLogic(data){

    var randomNumber = new Random();

    String luckyNumber = '${randomNumber.nextInt(31)}';

    _inLuckyNumberStream.add(luckyNumber); // to run the luckyNumber stream
  }

  String getLuckyNumber(){

    var randomNumber = new Random();

    String luckyNumber = '${randomNumber.nextInt(31)}';

    return luckyNumber;
  }

  // release all resources
  @override
  void dispose() {

    _clickOnFABController.close();
  }
}