import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

const k=TextStyle(
    color: Colors.black87,
    fontSize: 30,
    fontWeight: FontWeight.bold
);
class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
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
  void initState(){
    _getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(children:const <Widget>[
          Expanded(
            flex:5,
            child: Text("Instagram",style: TextStyle(
                color: Colors.black87
            ),),

          ),
          Expanded(
              flex:5,
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.add,
                  color: Colors.black,
                ),
              ))
        ]
        )
    ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate((context,ind)
          {
            return Column(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      padding:const EdgeInsets.only(left:5,right: 5,top: 10)
                      ,child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          response[ind].practiceUrl
                      ),
                    ),
                    ),
                    Center(child:  Text(response[ind].id.toString(),style:k ,),)
                  ],
                ),
                Container(
                  margin:const EdgeInsets.only(top: 10,bottom: 10)
                  ,child: Image(image:NetworkImage(response[ind].practiceUrl),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                ),
                Row(

                  children: const <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.share),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.message_rounded),
                    )
                  ],

                ),
                Container(
                    alignment:Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 10,top:10,bottom: 20)
                    ,child: Text(response[ind].title,style:const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                ),))
              ],
            );
          },childCount: response.length))
        ],
      ),
    );
  }
}
class User {
  late final int id;
  late final String title;
  late final String practiceUrl;

  User(this.id, this.title, this.practiceUrl);

}