import 'dart:core';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorageService {
  static const _storage = FlutterSecureStorage();

  static const _keytoken = 'userToken';

  Future setUserToken(String userToken) async {
    var set = await _storage.write(
      key: _keytoken,
      value: userToken,
    );
    // ignore: avoid_print
    print('token berhasil disimpan');
    return set;
  }

  Future getUserToken() async {
    var get = await _storage.read(
      key: _keytoken,
    );
    // ignore: avoid_print
    print('token berhasil dibaca');
    return get;
  }

  Future deleteUserToken() {
    var delete = _storage.delete(
      key: _keytoken,
    );
    // ignore: avoid_print
    print('token berhasil dihapus');
    return delete;
  }
}
