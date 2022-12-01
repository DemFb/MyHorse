import 'package:my_horse/activities/competition/model/participant_model.dart';

class CompetitionModel {
  final String name;
  final String address;
  final String photoUrl;
  final String date;
  final List<dynamic>? participants;
  final String creatorId;

  const CompetitionModel({required this.name, required this.address, required this.photoUrl, required this.date, required this.creatorId, this.participants});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "address": address,
      "photoUrl": photoUrl,
      "date": date,
      "creatorId": creatorId
    };
  }

}
