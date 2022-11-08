import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:crud/model.dart';

class Databases{

  static final Databases instance= Databases._init();
  static Database? _database;

  Databases._init();
  Future<Database?> get database async{
    if(_database!= null)
      return _database;
    _database=await _initDB('employee.db');
    return _database;

  }
  Future<Database> _initDB(String filepath) async {
    final dbpath= await getDatabasesPath();
    final path= join(dbpath,filepath);
    return await openDatabase(path,version: 1,onCreate: _createdb);
  }

 Future   _createdb(Database db,int version) async {
    final idtype='INTEGER PRIMARY KEY AUTOINCREMENT';
    final integertype='INTEGER NOT NULL';
    final texttype='TEXT NOT NULL';
    await db.execute("CREATE TABLE $tableempl (${employeFields.id} $idtype,${employeFields.empid} $integertype,${employeFields.name} $texttype, ${employeFields.desi}  $texttype)");
   }
   Future create(employee emp) async {
    final db=await instance.database;
    final id=await db!.insert(tableempl,emp.toJson());
    return emp.copy(id:id);
   }
    Future<employee> read(int id) async{
    final db=await instance.database;
    final map=await db!.query(tableempl,columns: employeFields.values,where: '${employeFields.id}=?',whereArgs: [id]);
    if(map.isNotEmpty){
      return employee.fromJson(map.first);
    }
    else{
      throw Exception('ID $id not found');
    }
    }

    Future<List<employee>> readall() async{
      final db=await instance.database;
      final orderby='${employeFields.id} ASC';
      final result=await db!.query(tableempl,orderBy: orderby);
      return result.map((json) => employee.fromJson(json)).toList();
    }
  Future<int> update(employee emp) async {
    final db = await instance.database;

    return db!.update(
      tableempl,
      emp.toJson(),
      where: '${employeFields.id} = ?',
      whereArgs: [emp.id],
    );
  }
  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(
      tableempl,
      where: '${employeFields.id} = ?',
      whereArgs: [id],
    );
  }


    Future close() async{
    final db=await instance.database;
    db!.close();
   }


}