import 'dart:convert';

import 'package:storma/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:storma/services/secure_storage_service.dart';

class AuthService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';
  final UserSecureStorageService userSecureStorageService =
      UserSecureStorageService();

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      UserSecureStorageService().setUserToken(user.token);

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      UserSecureStorageService().setUserToken(user.token);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<UserModel> getUser({
    required String token,
  }) async {
    var url = '$baseUrl/user';
    var headers = {
      'Accept': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      user.token = token;

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<bool> logout({
    required String token,
  }) async {
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      UserSecureStorageService().deleteUserToken();
      return true;
    } else {
      throw Exception('Gagal Logout');
    }
  }

  Future<UserModel> updateProfile({
    required String name,
    required String username,
    required String email,
    required String token,
  }) async {
    var url = '$baseUrl/user';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }
}
