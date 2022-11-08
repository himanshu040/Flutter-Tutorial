import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './person.dart';
import 'package:getwidget/getwidget.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create:(context)=>Person(),
    child:const MyApp()
  )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Profile",
      home:Profile(),
    );
  }
}
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}
Person p=new Person();

class _ProfileState extends State<Profile> {
  late String valueText;
  TextEditingController _textFieldController = TextEditingController();
  Future<void> displayTextInputDialog(BuildContext context) async {

  }
  @override
  Widget profile()
  {
    return Center(

      child:Stack(
        alignment: Alignment.center,
        children:<Widget> [
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[

                Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Name",style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 5.0),
                                        child: Text(p.name,style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      )
                                      ,Container(
                                          margin:EdgeInsets.only(left: 5,right: 5),
                                          child:
                                          GFIconButton(
                                            onPressed: (){
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Center(child: Text('UPDATE NAME'),),
                                                      content: TextField(
                                                        onChanged: (value) {
                                                          setState(() {
                                                            valueText = value;
                                                          });
                                                        },
                                                        controller: _textFieldController,
                                                        decoration: InputDecoration(hintText: "Text Field in Dialog"),
                                                      ),
                                                      actions: <Widget>[
                                                        ElevatedButton(
                                                          child: Text('CANCEL'),
                                                          onPressed: () {
                                                            setState(() {
                                                            });
                                                          },
                                                        ),
                                                        ElevatedButton(
                                                          child: Text('OK'),
                                                          onPressed: () {
                                                            setState(() {
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  });

                                            },
                                            icon: Icon(Icons.edit),
                                            type: GFButtonType.outline,
                                            size: GFSize.SMALL,
                                          )
                                      )

                                    ],
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("App Version",style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 5.0),
                                        child: Text(p.appversion,style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      )
                                      ,Container(
                                          margin:EdgeInsets.only(left: 5,right: 5),
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                          )
                                      )

                                    ],
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Username",style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 5.0),
                                        child: Text(p.username,style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      )
                                      ,Container(
                                          margin:EdgeInsets.only(left: 5,right: 5),
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                          )
                                      )

                                    ],
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Email",style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 5.0),
                                        child: Text(p.email,style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      )
                                      ,Container(
                                          margin:EdgeInsets.only(left: 5,right: 5),
                                          child: GFIconButton(
                                            onPressed: (){},
                                            icon: Icon(Icons.edit),
                                            type: GFButtonType.outline,
                                            size: GFSize.SMALL,
                                          )
                                      )

                                    ],
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(

                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Password",style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 5.0),
                                        child: Text("*********",style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      )
                                      ,Container(
                                          margin:EdgeInsets.only(left: 5,right: 5),
                                          child:  SizedBox(
                                            width: 40,
                                            height: 40,
                                          )
                                      )

                                    ],
                                  ),

                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                )
                ,
                Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Password",style:  TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5.0),
                                  child: Text("*********",style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500
                                  ),),
                                )
                                ,Container(
                                    margin:EdgeInsets.only(left: 5,right: 5),
                                    child:  SizedBox(
                                      width: 40,
                                      height: 40,
                                    )
                                )

                              ],
                            ),

                          ),
                        ),
                      ],
                    )

                )


              ],
            ),
            elevation: 40,
            shadowColor: Colors.grey,
          )
          ,
      Positioned(
        top: 40,


          child: CircleAvatar(
            radius: 80,//radius is 50
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/03/03/20/42/man-657869_1280.jpg'),//image url
          )
      )
        ],
      )



    );

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),

      ),
      body:profile()


    );
  }


}



