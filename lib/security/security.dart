import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class Security {

  final key = Key.fromSecureRandom(32);
  final iv = IV.fromSecureRandom(16);

  String hash({required String value}) {
    final List<int> bytes = utf8.encode(value);
    return sha256.convert(bytes).toString();
  }

  /// Encrypt value to base 64
  String encrypt({required Map<String, dynamic> value}) {
    Encrypter encrypter = Encrypter(AES(key));
    return encrypter.encrypt(json.encode(value), iv: iv).base64;
  }

  /// Decrypt base 64 encrypted String to normal String
  String decrypt({required String value}) {
    final encrypter = Encrypter(AES(key));
    return encrypter.decrypt64(value, iv: iv);
  }

  /// Generate random String
  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }

}
