 import '../../horse/model/horse_model.dart';

class UserModel {

  final String? id;
  final String username;
  final String password;
  final String email;
  final String photoUrl;
  final List<HorseModel>? horses;
  final int? age;
  final int? phoneNumber;
  final String? salt;
  final List<String> roles;
  final String? linkFFE;


  const UserModel({
        required this.username, required this.password, required this.email,
        required this.photoUrl, required this.roles, this.salt, this.id, this.horses, this.age, this.phoneNumber, this.linkFFE
      });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
      "email": email,
      "photoUrl": photoUrl,
      "roles": roles
    };
  }

}
