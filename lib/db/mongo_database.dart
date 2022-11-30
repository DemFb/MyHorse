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

  /// This is a simple exemple of Insert, but for each features
  /// We will create a new service that will contains our methods that makes calls to the Database
  exampleInsert() async {
    // Here we get our getter defined above
    getDb.collection(DbEnum.usersCollection.value).insert({"username": "sfsdf", "password": "azeaz"});
  }

}