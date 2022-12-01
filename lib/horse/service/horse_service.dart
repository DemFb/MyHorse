import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_horse/extension/async_map.dart';
import 'package:my_horse/horse/model/horse_model.dart';

import '../../db/enum/db_enum.dart';
import '../../db/mongo_database.dart';

class HorseService {

  final String horseCollection = DbEnum.horseCollection.value;

  /// Create a new Horse
  Future<HorseModel?> createHorse({required Map<String, dynamic> horseData}) async {

    final Map<String, dynamic>? user = await MongoDatabase.getUser(userId: horseData["ownerId"], excludeFields: ["password", "email", "salt", "photoUrl"]);
    late HorseModel? response;

    if (user != null) {
      WriteResult horse = await MongoDatabase.getDb.collection(horseCollection).insertOne(horseData);
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

  /// Add a Demi pension to a Horse
  Future<HorseModel?> addHorseDemiPension({required String userId, required String horseId}) async {
    final Map<String, dynamic>? horse = await _getHorseByOwnerId(ownerId: userId);

    if (horse != null) {
      return null;
    }

    final Map<String, dynamic>? user = await MongoDatabase.getUser(userId: userId, excludeFields: ["password", "email", "salt", "photoUrl"]);
    late HorseModel? response;

    if (user != null) {
      WriteResult updateHorse = await MongoDatabase.getDb.collection(horseCollection)
          .updateOne(where.eq("_id", ObjectId.fromHexString(horseId)),
          ModifierBuilder().set("demiPensionId", userId)
      );

      if (updateHorse.nModified == 1) {
        response = await _horseResultModel(horseId: horseId);
      }

    }

    return response;
  }

  /// Update horse data
  Future<HorseModel?> updateHorse({required String ownerId, required String horseId, required Map<String, dynamic> horseData}) async {

    final Map<String, dynamic>? ownerHorse = await _getHorseByOwnerId(ownerId: ownerId);

    if (ownerHorse == null) {
      return null;
    }

    late HorseModel response;
    int countMultipleFieldsUpdate = 0;

    if (horseData.length > 1) {
      /// Multiple fields update
      await horseData.forEachAsync((key, value) async {
        await MongoDatabase.getDb.collection(horseCollection)
            .updateOne(where.eq("_id", ObjectId.fromHexString(horseId)), ModifierBuilder().set(key, value)
        );
        countMultipleFieldsUpdate++;
      });

      if (countMultipleFieldsUpdate == horseData.length) {
        response = await _horseResultModel(horseId: horseId);
      }

    } else {
      await MongoDatabase.getDb.collection(horseCollection)
          .updateOne(where.eq("_id", ObjectId.fromHexString(horseId)), ModifierBuilder().set(horseData.keys.first, horseData.values.first)
      );
      response = await _horseResultModel(horseId: horseId);
    }

    return response;
  }

  /// Retrieve horse By ownerId
  Future<Map<String, dynamic>?> _getHorseByOwnerId({required String ownerId}) async {
    return await MongoDatabase.getDb?.collection(horseCollection).findOne(where.eq("ownerId", ownerId));
  }

  /// Retreive horse by horse Id
  Future<Map<String, dynamic>?> _getHorseByHorseId({required String horseId}) async {
    return await MongoDatabase.getDb.collection(horseCollection).findOne(where.eq("_id", ObjectId.fromHexString(horseId)));
  }

  Future<HorseModel> _horseResultModel({required String horseId}) async {
    final Map<String, dynamic>? getUpdatedHorse = await _getHorseByHorseId(horseId: horseId);
    return HorseModel(
        photoUrl: getUpdatedHorse!["photoUrl"] as String, name: getUpdatedHorse["name"] as String,
        age: getUpdatedHorse["age"] as int, robe: getUpdatedHorse["robe"] as String, race: getUpdatedHorse["race"] as String, gender: getUpdatedHorse["gender"] as String,
        speciality: getUpdatedHorse["speciality"] as String, ownerId:  getUpdatedHorse["ownerId"] as String, id: (getUpdatedHorse["_id"] as ObjectId).$oid,
        demiPensionId: getUpdatedHorse["demiPensionId"]
    );
  }

}
