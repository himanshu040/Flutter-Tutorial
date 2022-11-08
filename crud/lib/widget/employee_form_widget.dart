import 'package:flutter/material.dart';

class EmployeeFormWidget extends StatelessWidget {
  final int? empid;
  final String? name;
  final String? desi;
  final ValueChanged<int> onChangeempid;
  final ValueChanged<String> onChangename;
  final ValueChanged<String> onChangedesi;

  const EmployeeFormWidget({Key? key,
  this.empid,
  this.desi,
  this.name,
  required this.onChangeempid,
  required this.onChangename,
  required this.onChangedesi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("${empid}",  style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),),
             Slider(
                 value:(empid??0).toDouble(),
                 onChanged: (empid)=>onChangeempid(empid.toInt()),
             min: 0,
             max: 100,
             divisions: 100,),
            TextFormField(
              maxLines: 1,
              initialValue: name,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'NAME',
                hintStyle: TextStyle(color: Colors.white70),
              ),
              validator: (name) =>
              name != null && name.isEmpty ? 'The name cannot be empty' : null,
              onChanged: onChangename,
            ),
            SizedBox(
              height: 8,
            ),
    TextFormField(
    maxLines: 5,
    initialValue: desi,
    style: TextStyle(color: Colors.white60, fontSize: 18),
    decoration: InputDecoration(
    border: InputBorder.none,
    hintText: 'Type designation...',
    hintStyle: TextStyle(color: Colors.white60),
    ),
    validator: (title) => title != null && title.isEmpty
    ? 'The designation cannot be empty'
        : null,
    onChanged: onChangedesi,
    ),


          ],
        )

      ),
    );
  }
}
