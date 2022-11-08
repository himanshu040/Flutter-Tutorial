

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
const k=TextStyle(
    color: Colors.black87,
    fontSize: 30,
    fontWeight: FontWeight.bold
);
class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  List<User> response = [];
  Future<List<User>> _getUser() async{
    var data= await http.get(Uri.parse("https://run.mocky.io/v3/71040f85-83a4-45ee-b05a-bf998bf201b1"));

    //https://www.youtube.com/watch?v=YwD1ChvdEHM
    print(data.statusCode);
    var jsonData = json.decode(data.body);
    print(jsonData);
    setState(() {
      for (var u in jsonData){
        User user = User (u["id"],u["title"],u["practiceUrl"]);
        response.add(user);
        print("Response.........$response[index].id");
      }
    });
    return response;
  }
  Widget build(BuildContext context) {

    return response.isEmpty?
    const Center(
      child: CircularProgressIndicator(),
    ):
    Column(
      children: [
        SizedBox(
          height: 50,

          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: response.length,itemBuilder: (BuildContext context,int d){
            return
              Container(
                padding: EdgeInsets.all(2) ,
                child: CircleAvatar(
                  radius:30 ,
                  backgroundImage: NetworkImage(
                      response[d].practiceUrl
                  ),
                ),
              );
          }
          ),
        ),



      ],
    );
  }
}
class User {
  late final int id;
  late final String title;
  late final String practiceUrl;

  User(this.id, this.title, this.practiceUrl);

}