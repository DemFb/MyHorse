import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_horse/db/enum/db_enum.dart';

class MongoDatabase {


  static late Db _db;

  static Db get getDb {
    return _db;
  }


/*  Db? _db;

   Db? get getDb => _db;*/

  // Connection to the Database
  static Future<void> connect() async {
    Db db = await Db.create(DbEnum.dbUrl.value);

  }

  /// Retrieve a User
  /// If " excludesFields " the specified fields will not be retrieved
  /// eg : excludeFields["password", "email"], those two fields will not be retrieved
  static Future<Map<String, dynamic>?> getUser({required String userId, List<String>? excludeFields}) async {
    return await getDb?.collection(DbEnum.usersCollection.value).findOne(where.eq("_id", ObjectId.fromHexString(userId)).excludeFields(excludeFields!));
  }

}