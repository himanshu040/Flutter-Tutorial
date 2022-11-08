import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snackbar',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Snackbar"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(onPressed: (){
                Get.snackbar("Snackbar Title",
                  "This will snackbar message",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text("Show Snackbar"),),
              RaisedButton(onPressed: (){
                Get.defaultDialog(
                  title: "Dialogue title",
                  middleText: "This is middle text",
                  radius: 80,
                  textCancel: "Cancel",
                  textConfirm: "Confirm",
                  onCancel: (){},
                  onConfirm: (){}
                );
              },
                child: Text("Show Dialogue box"),)
            ],,
          )
        ),
      ),
    );
  }
}
