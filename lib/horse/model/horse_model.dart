
class HorseModel {

  final String? id;
  final String photoUrl;
  final String name;
  final int age;
  final String robe;
  final String race;
  final String gender;
  final String speciality;
  final String ownerId;
  final String? demiPensionId;

  const HorseModel({
      required this.photoUrl,
      required this.name,
      required this.age,
      required this.robe,
      required this.race,
      required this.gender,
      required this.speciality,
      required this.ownerId, this.id, this.demiPensionId
      });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "age": age,
      "robe": robe,
      "race": race,
      "gender": gender,
      "speciality": speciality,
      "ownerId": ownerId,
      "photoUrl": photoUrl
    };
  }

}
