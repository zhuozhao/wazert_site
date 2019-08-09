
import 'package:flutter/cupertino.dart';

class FunctionMenu{

  IconData icon;
  String name;

  FunctionMenu(IconData i, String n){

    icon = i;
    name = n;

  }


  String getName(){

    return name;
  }
  IconData getIcon(){

    return icon;
  }
}