import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:properinstademo/drawerwidget/Drawer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<User> response = [];
  Future<List<User>> _getUser() async{
    var data= await http.get(Uri.parse("https://run.mocky.io/v3/71040f85-83a4-45ee-b05a-bf998bf201b1"));

    //https://www.youtube.com/watch?v=YwD1ChvdEHM
    print("jason status${data.statusCode}");
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
  @override
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
      body:response.isEmpty?
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
      ),

               drawer: const drawerWidget(),
               bottomNavigationBar: Container(
                  color: Colors.white,
                  height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                             Icon(Icons.home,),
                            Icon(Icons.search)
                          ],
      ),
      ),
    ) ;





  }
}
class User {
  late final int id;
  late final String title;
  late final String practiceUrl;

  User(this.id, this.title, this.practiceUrl);

}