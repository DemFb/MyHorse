import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_horse/activities/competition/model/competition_model.dart';
import 'package:my_horse/db/enum/db_enum.dart';
import 'package:my_horse/db/mongo_database.dart';

class CompetitionService {

  final String competitionCollection = DbEnum.competitionCollection.value;
  final RegExp dateRegex = RegExp(r"^(?=\d{2}([\/])\d{2}\1\d{4}$)(?:0[1-9]|1\d|[2][0-8]|29(?!.02.(?!(?!(?:[02468][1-35-79]|[13579][0-13-57-9])00)\d{2}(?:[02468][048]|[13579][26])))|30(?!.02)|31(?=.(?:0[13578]|10|12))).(?:0[1-9]|1[012]).\d{4}$");

  Future<CompetitionModel?> createCompetition({required Map<String, dynamic> competitionData}) async {
    if (!dateRegex.hasMatch(competitionData["date"])) {
      return null;
    }

    late CompetitionModel response;
    WriteResult competition = await MongoDatabase.getDb.collection(competitionCollection).insertOne(competitionData);
    if (competition.nInserted > 0) {
      response = CompetitionModel(
          name: competition.document!["name"] as String,
          address: competition.document!["address"] as String,
          photoUrl: competition.document!["photoUrl"] as String,
          date: competition.document!["date"] as String,
          creatorId: competition.document!["creatorId"] as String,
      );
    }
    return response;
  }

  Future<CompetitionModel?> addParticipantToCompetition({required String competitionId, required Map<String, dynamic> participant}) async {
    final Map<String, dynamic>? competition = await _findCompetitionById(competitionId: competitionId);

    if (competition == null) {
      return null;
    }

    late WriteResult writeResult;
    late CompetitionModel response;

    if (competition["participants"] == null) {
       writeResult = await MongoDatabase.getDb
          .collection(competitionCollection)
          .updateOne(where.eq("_id", ObjectId.fromHexString(competitionId)), ModifierBuilder().set("participants", [participant]));
    } else {
       writeResult = await MongoDatabase.getDb
          .collection(competitionCollection)
          .updateOne(where.eq("_id", ObjectId.fromHexString(competitionId)), ModifierBuilder().set("participants", [...competition["participants"], participant]));
    }

    if (writeResult.nModified > 0) {

      Map<String, dynamic>? result = await _findCompetitionById(competitionId: competitionId);
      response = CompetitionModel(
          name: result!["name"],
          address: result["address"],
          photoUrl: result["photoUrl"],
          date: result["date"],
          creatorId: result["creatorId"],
          participants: result["participants"]
      );
    }
    return response;
  }

  Future<Map<String, dynamic>?> _findCompetitionById({required String competitionId}) async {
    return await MongoDatabase.getDb.collection(competitionCollection).findOne(where.eq("_id", ObjectId.fromHexString(competitionId)));
  }

}
