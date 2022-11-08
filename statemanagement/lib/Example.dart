import 'package:flutter/cupertino.dart';

class Example extends ChangeNotifier {
  late int a=10;
  late String s="Himanshu";

  set setnumber(int a1){
    a=a1;
  }
  int get getnumber=>a;
  void updatename(String name)
  {
    this.s=name;
    notifyListeners();
  }
  Future<void> getupdatename() async
  {
    Future.delayed(Duration(seconds: 3),(){
      if(this.s=="Himanshu")
      updatename("Akash");
      else
        updatename("Himanshu");
    });

  }

}