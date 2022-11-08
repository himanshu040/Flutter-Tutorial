import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Themeprovider with ChangeNotifier{
  bool _isdarktheme=true;
  bool get isdarktheme=> _isdarktheme;
  void changetheme(bool val){
    _isdarktheme=!_isdarktheme;
    notifyListeners();
  }
}