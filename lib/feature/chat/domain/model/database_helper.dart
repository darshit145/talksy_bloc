import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model.dart';

// //Store the recent Watched Item at hear
// class DateBaseHelper{
//   static final DateBaseHelper instance = DateBaseHelper._instance();
//   static Database? _database;
//   static String senderId="";
//   static String receiverId="";
//
//   void senderIdAndReceiverId(String value, String val) {
//     senderId = value.split('@')[0];   // Extracts part before '@'
//     receiverId = val.split('@')[0];   // Extracts part before '@'
//   }
//
//
//   DateBaseHelper._instance();
//
//   Future<Database> get db async {
//     _database ??= await initDb();
//     return _database!;
//   }
//
//   Future<Database> initDb() async {
//     String databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'talksy.db');
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }
//   String generateChatTableName(String userId1, String userId2) {
//     List<String> sortedIds = [userId1, userId2]..sort();
//     return "${sortedIds[0]}_${sortedIds[1]}";
//   }
//
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//     CREATE TABLE topics(
//       cid INTEGER PRIMARY KEY,
//       sender_id TEXT ,
//       receiver_id TEXT,
//       message TEXT,
//       time TEXT
//     )
//   ''');
//   }
//
//
//
//
//   Future<int> insertRecent(Topic topic) async {
//     Database db = await instance.db;
//     fetchAndUpdateStream();
//     return await db.insert('topics', topic.toMap());
//   }
//
//   Future<void> removeBasedOnName(String nams)async{
//     Database db = await instance.db;
//     await db.delete('topics', where: 'topic_name = ?', whereArgs: [nams]);
//   }
//
//   Future<List<Topic>> getRecent() async {
//     Database db = await instance.db;
//     List<Map<String, dynamic>> maps = await db.query('topics');
//     List<Topic> topics=maps.map((e) {
//       return Topic.fromMap(e);
//     }).toList();
//     return topics;
//   }
//   final StreamController<List<Topic>> topicStreamController =
//   StreamController<List<Topic>>.broadcast();
//
//
//   Future<void> fetchAndUpdateStream() async {
//     List<Topic> topics = await getRecent();
//     topicStreamController.add(topics);
//   }
//
// }
//



class DatabaseHelper2 {
  static final DatabaseHelper2 instance = DatabaseHelper2._instance();
  static Database? _database;

  DatabaseHelper2._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'recent_view.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create initial tables if needed
    await db.execute('''
      CREATE TABLE IF NOT EXISTS default_table (
        cid INTEGER PRIMARY KEY, 
        reciverId TEXT,
        senderId TEXT,
        message TEXT,
        time TEXT
      )
    ''');
  }

  Future<void> createTableIfNotExists(String tableName) async {
    final db = await instance.db;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        cid INTEGER PRIMARY KEY, 
        reciverId TEXT,
        senderId TEXT,
        message TEXT,
        time TEXT
      )
    ''');
  }

  Future<int> insert(String tableName, Map<String, dynamic> data) async {
    final db = await instance.db;
    await createTableIfNotExists(tableName);
    fetchAndUpdateStream(tableName);
    return await db.insert(tableName, data);
  }

  Future<void> remove(String tableName, String column, String value) async {
    final db = await instance.db;
    await createTableIfNotExists(tableName); // Ensure table exists
    await db.delete(tableName, where: '$column = ?', whereArgs: [value]);
  }

  Future<List<Map<String, dynamic>>> query(String tableName) async {
    final db = await instance.db;
    await createTableIfNotExists(tableName);
    return await db.query(tableName);
  }
  final StreamController<List<Topic>> topicStreamController =
  StreamController<List<Topic>>.broadcast();


  Future<void> fetchAndUpdateStream(String tableName) async {
    List<Topic> topics=[];
    List<Map<String, dynamic>> maps= await query(tableName);
    topics= maps.map((e) {
      return Topic.fromMap(e);
    },).toList();
    topicStreamController.add(topics);
    print("LLLLLLLLLLLLLLLLL$tableName");
  }
}