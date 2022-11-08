
final String tableempl= 'employee';

class employeFields{
 static final List<String> values=[id,empid,name,desi];

  static final String id='_id';
 static final String empid='empid';
  static final String name='name';
  static final String desi= 'designation';
 // static final String dateofjoin='dateofjoining';
}

class employee
{
final int? id;
final int empid;
final String name;
final String desi;
//final DateTime dateofjoin;
const employee(
{
  this.id,
  required this.empid,
  required this.name,
  required this.desi,
  //required this.dateofjoin
}
    );

employee copy(
{
  int? id,
  int? empid,
  String? name,
  String? desi,
  DateTime? dateofjoin
}
    )=>employee(id: id ?? this.id,
  empid: empid ?? this.empid,
  name: name ?? this.name,
  desi: desi ?? this.desi,
//  dateofjoin: dateofjoin ?? this.dateofjoin
);
static employee fromJson(Map<String,Object?> json)=>employee(
    id:json[employeFields.id] as int,
    empid: json[employeFields.empid] as int,
    name: json[employeFields.name] as String,
    desi: json[employeFields.desi] as String,
  //  dateofjoin:json[employeFields.dateofjoin] as DateTime
      );

Map<String,Object?> toJson()=>{
  employeFields.id: id,
  employeFields.empid:empid,
  employeFields.name: name,
  employeFields.desi: desi,
 // employeFields.dateofjoin:dateofjoin
};


}