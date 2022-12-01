import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_horse/horse/model/horse_model.dart';

import '../../db/enum/db_enum.dart';
import '../../db/mongo_database.dart';

class HorseService {

  /// Create a new Horse
  Future<HorseModel?> createHorse({required Map<String, dynamic> horseData}) async {

    final Map<String, dynamic>? user = await MongoDatabase.getDb.collection(DbEnum.usersCollection.value).findOne(where.eq("_id", ObjectId.fromHexString(horseData["ownerId"])));
    late HorseModel? response;

    if (user != null) {
      WriteResult horse = await MongoDatabase.getDb.collection(DbEnum.horseCollection.value).insertOne(horseData);
      Map<String, Object?>? horseDocument = horse.document;
      if (horseDocument != null) {
        response = HorseModel(
            photoUrl: horseDocument["photoUrl"] as String, name: horseDocument["name"] as String,
            age: horseDocument["age"] as int, robe: horseDocument["robe"] as String, race: horseDocument["race"] as String, gender: horseDocument["gender"] as String,
            speciality: horseDocument["speciality"] as String, ownerId:  horseDocument["ownerId"] as String, id: (horseDocument["_id"] as ObjectId).$oid
        );
      }
    }
    return response;
  }

}
