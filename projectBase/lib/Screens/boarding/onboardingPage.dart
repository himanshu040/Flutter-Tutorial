import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projectbase/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/Strings.dart';
import '../../constants/constants.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        title: Center(
          child:Text(
            "BOARDING PAGE"
          ),
        ),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(

              onPressed: () {
                setOnboarding();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "onBoarding"
              ),

            ),
          ),
        ),
      ),
    );
  }
  void setOnboarding() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    perf.setString(ONBOARDING, "true");
    //  String? onboarding = perf.getString(ONBOARDING);
  }
}
