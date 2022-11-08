import 'package:crud/db/database.dart';
import 'package:crud/model.dart';
import 'package:crud/pages/EmployeeDetailPage.dart';
import 'package:crud/pages/edit_add_employee.dart';
import 'package:crud/widget/EmployeeCardWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<employee> list=[];
 bool isLoading = false;
 void initState()
 {
   super.initState();
   refresh();
 }
 void dispose()
 {
   Databases.instance.close();
   super.dispose();
 }
 Future<void> refresh() async {
   setState(() {
     isLoading=true;
   });
   this.list=await Databases.instance.readall();
   print("List:${list}");
   print("List:${list.length}");
   print("isloding:${isLoading}");
   setState(() {
     isLoading=false;
   });
 }
  @override
  Widget build(BuildContext context) {
   print("List:${list.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employees',
          style: TextStyle(fontSize: 24),
        ),
        actions: [Icon(Icons.search), SizedBox(width: 12)],
      ),
      body: Center(
                child:isLoading?
                    CircularProgressIndicator():
                    list.isEmpty?
                    const Text("No Employee", style: TextStyle(color: Colors.white, fontSize: 24)):
                    buildEmployee()
      ),
      floatingActionButton: FloatingActionButton(
                    backgroundColor: Colors.black,
    child: const Icon(Icons.add),
    onPressed: () async {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AddEditEmplolyeePage()),
      );
      refresh();
    }
    )
    );
  }

  Widget buildEmployee()=>ListView.builder(
    padding: EdgeInsets.all(8),
    itemCount: list.length,
    itemBuilder: (context, index) {
      final employee = list[index];

      return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EmployeeDetailPage( id:employee.id!,),
          ));

          refresh();
        },
        child: EmployeeCardWidget(employe: employee, index: index),
      );
    },);
}
