import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_horse/authentication/model/user_model.dart';
import 'package:my_horse/db/enum/db_enum.dart';
import 'package:my_horse/db/mongo_database.dart';
import 'package:my_horse/security/security.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  final MongoDatabase mongoDatabase = MongoDatabase();
  final Security security = Security();
  final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

  /// Register a new User
  Future<void> register({required Map<String, dynamic> map}) async {
    try {
      String salt = security.generateRandomString(15);
      String passwordHashed = security.hash(value: map["password"] + salt);

      await MongoDatabase.getDb.collection(DbEnum.usersCollection.value).insertOne({
        "username": map["username"],
        "password": passwordHashed,
        "salt": salt,
        "email": map["email"],
        "photoUrl": map["photoUrl"],
        "roles": ["user"]
      },);
    } catch (e) {
      print(e);
    }

  }

  /// Log a user
  Future<void> login({required Map<String, String> data}) async {
    final value = await MongoDatabase.getDb.collection(DbEnum.usersCollection.value).findOne(where.match("email", data["email"]!));
    final String passwordHashed = security.hash(value: "${data["password"]}${value!["salt"]}");
    SharedPreferences prefs = await _sharedPreferences;

    if (passwordHashed == value["password"]) {
      String token = security.encrypt(value: {"username": value["username"], "email": value["email"], "id": (value["_id"] as ObjectId).$oid});
      prefs.setString("token", token);
    }

  }

  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    List<Map<String, dynamic>> result = await MongoDatabase.getDb.collection(DbEnum.usersCollection.value).find().toList();

    for (Map<String, dynamic> element in result) {
      print(element);
      users.add(
        UserModel(username: element["username"], password: element["password"],
            email: element["email"], photoUrl: element["photoUrl"], roles: element["roles"], id: (element["_id"] as ObjectId).$oid
        )
      );
    }
    print(users);
    return users;
  }

}
