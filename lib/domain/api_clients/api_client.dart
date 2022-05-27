import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../model/my_order_list.dart';

class ApiClient {
  final _client = HttpClient();

  Future registerUser(String phoneNumber, String password, String email) async {
    final url = Uri.parse(
      'http://81.90.180.95/api_user/api/register/',
    );
    final parametrs = <String, dynamic>{
      'phone': phoneNumber,
      'password': password,
      'email': email,
    };

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parametrs));
    final response = await request.close();
    final isResponseEmpty = await response.isEmpty;
    if(!isResponseEmpty){
      getCode(phoneNumber);
    }
  }

  Future getCode(String phoneNumber) async {
    final url = Uri.parse(
      'http://81.90.180.95/api_user/api/code/send/',
    );
    final parametrs = <String, dynamic>{
      'phone': phoneNumber,
      'type': 1,
    };

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parametrs));
    await request.close();
  }

  Future verifyCode(String code, String phoneNumber, String password) async {
    final url = Uri.parse(
      'http://81.90.180.95/api_user/api/code/verify/',
    );
    final parametrs = <String, dynamic>{
      'code': code,
    };

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parametrs));
    final response = await request.close();
    final isResponseEmpty = await response.isEmpty;
    if(!isResponseEmpty){
      getToken(phoneNumber, password);
    }
  }

  Future<Map<String, dynamic>> getToken(String phoneNumber, String password) async {
    final url = Uri.parse('http://81.90.180.95/api_user/api/token/');
    final parametrs = <String, dynamic>{
      'phone': phoneNumber,
      'password': password,
    };

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parametrs));
    final response = await request.close();

    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v)) as Map<String, dynamic>;

    final refreshToken = json['refresh'] as String;
    final accessToken = json['access'] as String;

    final tokens = <String, dynamic>{
      'refreshToken': refreshToken,
      'accessToken': accessToken,
    };
    return tokens;
  }

  Future<List<MyOrderList>> getMyOrderList() async {
    final json = await getJson('http://81.90.180.95/route/api/my_order_list/')
        as List<dynamic>;

    final orders = json
        .map((dynamic order) =>
            MyOrderList.fromJson(order as Map<String, dynamic>))
        .toList();

    return orders;
  }

  Future<dynamic> getJson(String uri) async {
    final url = Uri.parse(uri);
    final request = await _client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);

    return json;
  }
}
