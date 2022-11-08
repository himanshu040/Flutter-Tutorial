import 'package:crud/db/database.dart';
import 'package:crud/model.dart';
import 'package:crud/widget/employee_form_widget.dart';
import 'package:flutter/material.dart';

class AddEditEmplolyeePage extends StatefulWidget {
  final employee? emp;
  const AddEditEmplolyeePage({Key? key,
  this.emp}) : super(key: key);

  @override
  State<AddEditEmplolyeePage> createState() => _AddEditEmplolyeePageState();
}

class _AddEditEmplolyeePageState extends State<AddEditEmplolyeePage> {
  final _formkey=GlobalKey<FormState>();
  late int empid;
  late String name;
  late String desig;
  void initState(){
    empid=widget.emp?.empid ?? 0;
    name=widget.emp?.name ?? '';
    desig=widget.emp?.desi??'';
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [buildbutton()],
      ),
      body: Form(
        key: _formkey,
        child: EmployeeFormWidget(
          empid: empid,
          name: name,
          desi: desig,
          onChangeempid: (empid)=>setState(() {
            this.empid=empid;
            print("empid:${this.empid}");
          }),
          onChangedesi: (desig)=>setState(() {
            this.desig=desig;
            print("desig:${this.desig}");

          }),
          onChangename: (name)=>setState(() {
            this.name=name;
            print("name:${this.name}");

          }),
        ),

        ),

      );
  }

  Widget buildbutton(){
    final isformvalid=name.isNotEmpty&&desig.isNotEmpty;
    return Padding(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
    child: ElevatedButton(
      onPressed: addorupdateemployee, child: Text("SAVE"),
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: isformvalid ? null : Colors.grey.shade700,
      ),),);
  }
  void addorupdateemployee() async {
    final isValid = _formkey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.emp != null;

      if (isUpdating) {
        await updateemp();
      } else {
        await addemp();
      }

      Navigator.of(context).pop();
    }


  }
  Future updateemp() async {
    final emp = widget.emp!.copy(
      empid: empid,
      name: name,
      desi: desig,
    );

    await Databases.instance.update(emp);
  }

  Future addemp() async {
    final emp = employee(
      name: name,
      empid: empid,
      desi: desig,
    );

    await Databases.instance.create(emp);
  }
}
