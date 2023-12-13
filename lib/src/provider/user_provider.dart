import 'dart:convert';

import 'package:delivery/src/api/environment.dart';
import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final String _url = Environment.API_DELIVERY;
  final String _api = "/api/users";

  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
    return null;
  }

  Future<ResponseApi> create(User user) async {
    try {
      Uri url = Uri.http(_url, '$_api/register');
      String bodyParams = json.encode(user);
      Map<String, String> header = {'content-type': 'application/json'};
      final res = await http.post(url, headers: header, body: bodyParams);
      final data = json.decode(res.body);

      print(data);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error : $e');
      return ResponseApi.fromJson({'message': 'error del servidor'});
    }
  }

  Future<ResponseApi> login(String email, String password) async {
    try {
      Uri url = Uri.http(_url, '$_api/login');
      String bodyParams = json.encode({'email': email, 'password': password});
      Map<String, String> header = {'content-type': 'application/json'};
      final res = await http.post(url, headers: header, body: bodyParams);
      final data = json.decode(res.body);

      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error : $e');
      return ResponseApi.fromJson({'message': 'error del servidor'});
    }
  }

  Future<ResponseApi> getByEmail(String email) async {
    try {
      Uri url = Uri.http(_url, '$_api/find-by-email/$email');
      Map<String, String> header = {'content-type': 'application/json'};
      final res = await http.get(url, headers: header);
      final data = json.decode(res.body);

      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error : $e');
      return ResponseApi.fromJson({'message': 'error del servidor'});
    }
  }

  Future<ResponseApi> getByPhone(String phone) async {
    try {
      Uri url = Uri.http(_url, '$_api/find-by-phone/$phone');
      Map<String, String> header = {'content-type': 'application/json'};
      final res = await http.get(url, headers: header);
      final data = json.decode(res.body);

      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error : $e');
      return ResponseApi.fromJson({'message': 'error del servidor'});
    }
  }

  Future<ResponseApi> updateToken(String email, String token) async {
    try {
      Uri url = Uri.http(_url, '$_api/update-token');
      String bodyParams = json.encode({'email': email, 'token': token});
      Map<String, String> header = {'content-type': 'application/json'};
      final res = await http.put(url, headers: header, body: bodyParams);
      final data = json.decode(res.body);

      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error : $e');
      return ResponseApi.fromJson({'message': 'error del servidor'});
    }
  }
}
