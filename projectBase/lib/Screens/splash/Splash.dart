
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectbase/Screens/boarding/onboardingPage.dart';
import 'package:projectbase/Screens/dashboard/dashboard.dart';
import 'package:projectbase/constants/constants.dart';
import 'package:projectbase/login/login.dart';
import 'package:projectbase/utility/Util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/Strings.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late String version;
  final int splashDuration = 4;

  startTime() async {
    return Timer(Duration(seconds: splashDuration), () async {
      _navigatetohome();
    });
  }
  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 00), () {});

    SharedPreferences perf = await SharedPreferences.getInstance();
    String? onboarding = perf.getString(ONBOARDING)??"false";
    String? login = perf.getString(LOGIN)??"false";
    Util util = Util();
    bool isOnline = await util.hasInternet();
    if (isOnline || !isOnline) {
      if (onboarding == 'true') {
        if(login=='true')
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>Dashboard()));
        else
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>Login()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnBoardingPage()));

      }
    } else {
      Fluttertoast.showToast(
          msg: "No Internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.black,
          backgroundColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
      // _navigatetohome();
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: kFillaSurveyColor,
        statusBarColor: kFillaSurveyColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/img.png',
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        // constraints: BoxConstraints.expand(),
      ),
    );
  }

  //
  // Future<bool> _onBackPressed() async {
  //   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //   SystemNavigator.pop();
  //   return false;
  // }

  // check() async{
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? onboarding = sharedPreferences.getString(ONBOARDING);
  //   if (onboarding == "false") {
  //     return
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (builder) {
  //           return OnBoardingPage();
  //         },
  //       ),
  //     );
  //   } else {
  //     if (onboarding=="true") {
  //       return  Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (builder) {
  //             return Dashboard();
  //           },
  //         ),
  //       );
  //     } else {
  //       return  Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (builder) {
  //             return OnBoardingPage();
  //           },
  //         ),
  //       );
  //     }
  //   }
  // }

}
