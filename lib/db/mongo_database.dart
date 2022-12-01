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

  /// Retrieve a User
  /// If " excludesFields " the specified fields will not be retrieved
  /// eg : excludeFields["password", "email"], those two fields will not be retrieved
  static Future<Map<String, dynamic>?> getUser({required String userId, List<String>? excludeFields}) async {
    return await getDb.collection(DbEnum.usersCollection.value).findOne(where.eq("_id", ObjectId.fromHexString(userId)).excludeFields(excludeFields!));
  }

}
