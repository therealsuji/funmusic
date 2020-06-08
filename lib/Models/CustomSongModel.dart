import 'package:sqflite/sqflite.dart';

final String tableTodo = 'allSongs';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnDone = 'filePath';

class CustomMusicModel {
  int id;
  String title;
  String albumArtwork;
  String album;
  int albumId;
  String artist;
  int artistId;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,

    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
  CustomMusicModel();
  CustomMusicModel.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];

  }
}

class TodoProvider {
  Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnDone integer not null)
''');
        });
  }

  Future<CustomMusicModel> insert(CustomMusicModel todo) async {
    todo.id = await db.insert(tableTodo, todo.toMap());
    return todo;
  }

  Future<CustomMusicModel> getTodo(int id) async {
    List<Map> maps = await db.query(tableTodo,
        columns: [columnId, columnDone, columnTitle],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return CustomMusicModel.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(CustomMusicModel todo) async {
    return await db.update(tableTodo, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db.close();
}