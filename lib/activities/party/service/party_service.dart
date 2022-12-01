import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_horse/activities/party/model/party_model.dart';
import 'package:my_horse/db/enum/db_enum.dart';
import 'package:my_horse/db/mongo_database.dart';

class PartyService {

  final String partyCollection = DbEnum.partyCollection.value;
  final RegExp dateRegex = RegExp(r"^(?=\d{2}([\/])\d{2}\1\d{4}$)(?:0[1-9]|1\d|[2][0-8]|29(?!.02.(?!(?!(?:[02468][1-35-79]|[13579][0-13-57-9])00)\d{2}(?:[02468][048]|[13579][26])))|30(?!.02)|31(?=.(?:0[13578]|10|12))).(?:0[1-9]|1[012]).\d{4}$");

  Future<PartyModel?> createParty({required Map<String, dynamic> partyData}) async {
    if (!dateRegex.hasMatch(partyData["date"])) {
      return null;
    }

    late PartyModel response;
    WriteResult party = await MongoDatabase.getDb.collection(partyCollection).insertOne(partyData);

    if (party.nInserted > 0) {
      response = PartyModel(
        partyTheme: party.document!["partyTheme"] as String,
        photoUrl: party.document!["partyTheme"] as String,
        date: party.document!["partyTheme"] as String,
        fromHour: party.document!["partyTheme"] as String,
        partyCreator: party.document!["partyTheme"] as String
      );
    }
    return response;
  }

  Future<PartyModel?> addParticipantToParty({required String partyId, required Map<String, dynamic> participant}) async {
    final Map<String, dynamic>? party = await _findPartyById(partyId: partyId);

    if (party == null) {
      return null;
    }

    late WriteResult writeResult;
    late PartyModel response;

    if (party["partyParticipants"] == null) {
      writeResult = await MongoDatabase.getDb
          .collection(partyCollection)
          .updateOne(where.eq("_id", ObjectId.fromHexString(partyId)), ModifierBuilder().set("partyParticipants", [participant]));
    } else {
      writeResult = await MongoDatabase.getDb
          .collection(partyCollection)
          .updateOne(where.eq("_id", ObjectId.fromHexString(partyId)), ModifierBuilder().set("partyParticipants", [...party["partyParticipants"], participant]));
    }

    if (writeResult.nModified > 0) {

      Map<String, dynamic>? result = await _findPartyById(partyId: partyId);
      response = PartyModel(
        partyTheme: result!["partyTheme"],
        photoUrl: result["photoUrl"],
        date: result["date"],
        fromHour: result["fromHour"],
        partyCreator: result["partyCreator"],
        partyParticipants: result["partyParticipants"]
      );
    }
    return response;
  }

  Future<Map<String, dynamic>?> _findPartyById({required String partyId}) async {
    return await MongoDatabase.getDb.collection(partyCollection).findOne(where.eq("_id", ObjectId.fromHexString(partyId)));
  }


}
