import 'dart:convert';

import 'package:flutter/cupertino.dart';
import './Example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
import './video.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Example(),
      child: const MyApp(),
    ),
  );

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     title: 'MyApp',
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget providerexample()
  {
    return Center(
        child:Text("${(Provider.of<Example>(context)).a}"));
  }



  Future<Videomodel> getuserdata() async{
    var re=await http.get(Uri.parse("http://35.171.221.132:8055/events/vedios"));
    if(re.statusCode==200)
      {
        print(re.statusCode);
        print(re.body);
       return Videomodel.fromJson(jsonDecode(re.body));
      }
    return throw ("Exception in NaOverview ${re.statusCode.toString()}");
  }
  Videomodel ?_mapre;
  List<Datum>  ?_mapd;
  Map<String,dynamic>? _ad;
  List<String>? _th;
  String? _s;
  void initState()
  {
    getuserdata().then((value){
      setState(() {
        _mapre=value;
        _mapd=_mapre?.data;
        _ad=_mapd![0] as Map<String, dynamic>?;
        _th=_ad!["video"];
        _s=_th![0];
      });
    });
    super.initState();
  }
  Widget apicalling()
  {
    return Center(
     child:Text(_s!)
    );
  }


  Widget consumerexample()
  {
   return Center(
     child: Consumer<Example>(builder:(context,providerv,child){
       return Column(
         children: [
           Text(providerv.s,style: const TextStyle(
             fontSize: 30.0,
             color: Colors.black87,
             fontWeight: FontWeight.w300

           ),),
        CupertinoButton(child: const Text("UPDATE NAME"), onPressed:(){ providerv.getupdatename();
        })
         ],

       );

     }),
   );
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
          title:const  Text("State Management",)
      ),
      body:apicalling()
    );
  }
}


