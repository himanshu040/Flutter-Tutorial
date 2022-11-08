import 'package:crud/db/database.dart';
import 'package:crud/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'edit_add_employee.dart';

class EmployeeDetailPage extends StatefulWidget {
  final int id;
  const EmployeeDetailPage({
       Key? key,
    required this.id}) : super(key: key);

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
    employee emp=employee(empid: 0, name: "", desi: "");
  bool isloading=false;
  @override
  void initState(){
    super.initState();
    refresh();
  }

   Future<void> refresh() async{

     setState(() => isloading = true);

     this.emp = await Databases.instance.read(widget.id);

     setState(() => isloading = false);
   }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [editbutton(),deleteButton()],

      ),
      body: isloading?
      Center(
        child: CircularProgressIndicator(),
      ):Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            Text(
              "${emp.empid}", style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 8),
            Text(
              emp.name, style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
            ),
            SizedBox(height: 8),
            Text(
              emp.desi,
              style: TextStyle(color: Colors.white70, fontSize: 18),
            )
          ],
        ),
      )
    );
  }
  Widget editbutton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isloading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditEmplolyeePage(emp:emp),
        ));

       refresh();
      });
    Widget deleteButton() => IconButton(
      icon: Icon(Icons.delete),
      onPressed: () async {
        await Databases.instance.delete(widget.id);

        Navigator.of(context).pop();
      },
    );

}
