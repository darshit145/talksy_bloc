import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:talksy_app/feature/chat/domain/model/user_message.dart';

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




//Store the recent Watched Item at hear
class DateBaseHelper{
  static final DateBaseHelper instance = DateBaseHelper._instance();
  static Database? _database;

  DateBaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'message.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE  chat (
        cid INTEGER PRIMARY KEY, 
        msg TEXT,
        fromU TEXT,
        toU TEXT,
        dateSendingTime INTEGER,
        readStatus TEXT,
        day TEXT  
      )
  ''');
  }



  Future<int> insertRecent(Message topic) async {
    Database db = await instance.db;
    return await db.insert('chat', topic.toMap());
  }

  Future<void> removeBasedOnName(String nams)async{
    Database db = await instance.db;
    await db.delete('topics', where: 'topic_name = ?', whereArgs: [nams]);
  }

  Future<List<Message>> getRecent() async {
    Database db = await instance.db;
    List<Map<String, dynamic>> maps = await db.query('chat');
    return maps.map((e) {
     return Message.fromJson2(e);
    },).toList();
    // return maps;
  }
  Future<void> getChatMessages({required String fromU, required String toU}) async {
    Database db = await instance.db;
    List<Map<String, dynamic>> maps = await db.query(
      'chat',
      where: 'fromU = ? AND toU = ?',
      whereArgs: [fromU, toU],
    );
    print(maps);
  }

  Future<void> deleteAllChats() async {
    Database db = await instance.db;
    await db.delete('chat');
  }

  // Future<List<Message>> getRecent() async {
  //   Database db = await instance.db;
  //   List<Map<String, dynamic>> maps = await db.query('topics');
  //   List<Message> topics=maps.map((e) {
  //     return Message.fromMap(e);
  //   }).toList();
  //   return topics;
  // }
}
