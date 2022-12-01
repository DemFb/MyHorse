
class PartyParticipants {

  final String userId;
  final String comment;

  const PartyParticipants({required this.userId, required this.comment});

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "comment": comment
    };
  }

}
