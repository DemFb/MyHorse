import 'package:my_horse/activities/competition/model/participant_model.dart';

class CompetitionModel {
  final String name;
  final String address;
  final String photoUrl;
  final String date;
  final List<ParticipantModel>? participants;

  const CompetitionModel({required this.name, required this.address, required this.photoUrl, required this.date, this.participants});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "address": address,
      "photoUrl": photoUrl,
      "date": date
    };
  }

}
