import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_horse/db/enum/db_enum.dart';

class MongoDatabase {

  static late Db _db;

  static Db get getDb {
    return _db;
  }

  // Connection to the Database
  static connect() async {
    var db = await Db.create("mongodb+srv://horse:horse@cluster0.qwtugl3.mongodb.net/horse?retryWrites=true&w=majority&ssl=true");
    await db.open();
    _db = db;
    return _db;
  }
}