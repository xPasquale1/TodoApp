import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/models/task.dart';

class DB {
  static Database? _db;

  static Future<Database> open() async {
    if (_db != null) return _db!;
    final path = join(await getDatabasesPath(), 'database.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          description TEXT,
          completed INTEGER
        )
      ''');
      },
    );
    return _db!;
  }

  static Future<Task?> addTask(String title, String description) async {
    final db = await DB.open();
    final id = await db.insert('tasks', {
      'title': title,
      'description': description,
      'completed': 0,
    });
    if (id <= 0) return null;
    return Task(id: id, title: title, description: description);
  }

  static Future<void> updateTask(Task task) async {
    final db = await DB.open();
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  static Future<Task?> getTaskById(int id) async {
    final db = await DB.open();
    List<Map<String, Object?>> result = await db.query(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isEmpty) return null;
    Map<String, Object?> first = result[0];
    return Task(
      id: first['id'] as int,
      title: first['title'] as String,
      description: first['description'] as String,
      completed: (first['completed'] as int) == 1,
    );
  }

  static Future<void> deleteTask(Task task) async {
    final db = await DB.open();
    await db.delete('tasks', where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<List<Task>> getAllTasks() async {
    final db = await open();
    final rows = await db.query('tasks');

    return rows
        .map(
          (row) => Task(
            id: row['id'] as int,
            title: row['title'] as String,
            description: row['description'] as String,
            completed: (row['completed'] as int) == 1,
          ),
        )
        .toList();
  }
}
