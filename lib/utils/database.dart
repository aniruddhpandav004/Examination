import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? _db;

  Future<Database?> checkDatabase()async{
    if(_db!= null)
    {
      return _db;
    }
    else{
      return await createDatabase();
    }
  }
  Future<Database>createDatabase()async{
    Directory folder = await getApplicationDocumentsDirectory();
    String path = join(folder.path,"data.db");
    return openDatabase(path,version: 1,onCreate: (_db,version){
      String query = "CREATE TABLE data(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,content TEXT,publishedAt TEXT,image TEXT)";
      _db.execute(query);
    });
  }
  void insertData(String t1,String d1,String c1,String p1,String im1)
  async{
    _db = await checkDatabase();
    _db!.insert("data", {"title" : t1,"description" : d1,"content" : c1,"publishedAt" : p1,"image" : im1});
  }
  Future<List<Map>> readData()async{
    _db = await checkDatabase();
    String query = "SELECT * FROM data";
    List<Map> datalist = await _db!.rawQuery(query,null);
    return datalist;
  }
  void deleteData(String id) async {
    _db = await checkDatabase();
    _db!.delete('data', where: 'id = ?', whereArgs: [int.parse(id)]);
  }
  void updateData(String i1,String t1,String d1,String c1,String p1,String im1) async {
    _db = await checkDatabase();
    _db!.update('data',{"id":i1,"title" : t1,"description" : d1,"content" : c1,"publishedAt" : p1,"image" : im1});
  }

}