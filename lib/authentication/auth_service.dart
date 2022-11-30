

import 'package:my_horse/authentication/model/user_model.dart';
import 'package:my_horse/db/mongo_database.dart';

class AuthService {

  final MongoDatabase mongoDatabase = MongoDatabase();

  /// Register a new User
  Future<void> register({required UserModel userModel}) async {

  }

}
