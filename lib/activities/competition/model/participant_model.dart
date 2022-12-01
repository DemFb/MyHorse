
class ParticipantModel {
  final String userId;
  final String level;

  const ParticipantModel({required this.userId, required this.level});

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "level": level
    };
  }

}
