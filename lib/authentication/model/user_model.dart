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
  final String salt;


  const UserModel({required this.username, required this.password, required this.email, required this.photoUrl, required this.salt, this.id, this.horses, this.age, this.phoneNumber});

}
