
class PartyModel {

  final String partyTheme;
  final String photoUrl;
  final String date;
  final String fromHour;
  final String partyCreator;
  final List<dynamic>? partyParticipants;

  const PartyModel({
    required this.partyTheme,
    required this.photoUrl,
    required this.date,
    required this.fromHour,
    required this.partyCreator,
    this.partyParticipants
  });

  Map<String, dynamic> toMap() {
    return {
      "partyTheme": partyTheme,
      "photoUrl": photoUrl,
      "date": date,
      "fromHour": fromHour,
      "partyCreator": partyCreator
    };
  }

}
