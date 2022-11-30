import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_horse/db/enum/db_enum.dart';

class MongoDatabase {

  static late Db _db;

  static Db get getDb {
    return _db;
  }

  // Connection to the Database
  static Future<Db> connect() async {
    final Db db = await Db.create(DbEnum.dbUrl.value);
    await db.open();
    _db = db;
    return _db;
  }
}