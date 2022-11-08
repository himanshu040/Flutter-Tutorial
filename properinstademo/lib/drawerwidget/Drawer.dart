

import 'package:flutter/material.dart';
import 'package:properinstademo/Screens/Posts.dart';
import 'package:properinstademo/Screens/home.dart';
import 'package:properinstademo/Screens/stories.dart';



class drawerWidget extends StatefulWidget {
  const drawerWidget({Key? key}) : super(key: key);

  @override
  _drawerWidgetState createState() => _drawerWidgetState();
}

class _drawerWidgetState extends State<drawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.only(top: 50),
        children: <Widget>[
          Column(
            children: [
              const SizedBox(height: 12),
              buildMenuItem(
                text: 'Stories',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Posts',
                icon: Icons.favorite_border,
                onClicked: () => selectedItem(context, 1),
              ),

            ],
          )

        ],
      ),
    );
  }
}
Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.black87;
  final hoverColor = Colors.black12;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}
void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>HomeScreen(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>Posts(),
      ));
      break;
  }
}
