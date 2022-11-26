import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/data/models/login_model.dart';

import '../../constants/base_url.dart';
import '../models/product_model.dart';

abstract class RemoteRepositories {
  Future<dynamic> postLogin(String url, LoginModel login);
  Future<dynamic> postRequest(String url, dynamic data);
  Future<ProductModel> getProduct(String url);
}

class RemoteRepositoriesImpl implements RemoteRepositories {
  @override
  Future postLogin(String url, LoginModel login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.post(
        Uri.parse('$baseUrl$url'),
        body: login.toJson(),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
      );
      if (response.statusCode == 200) {
        prefs.setString('token', json.decode(response.body)['data']['token']);
        prefs.setInt(
            'userid', json.decode(response.body)['data']['user']['id']);
        prefs.setString(
            'phone', json.decode(response.body)['data']['user']['handphone']);
        prefs.setString(
            'email', json.decode(response.body)['data']['user']['email']);
        prefs.setString(
            'name', json.decode(response.body)['data']['user']['name']);
        return returnResponse(response);
      }
      return returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  @override
  Future postRequest(String url, data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$url'),
        body: data.toJson(),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
      );
      if (response.statusCode == 200) {
        return returnResponse(response);
      }
      return returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw json.decode(response.body)['info'];
      case 401:
        throw json.decode(response.body)['info'];
      case 404:
        throw json.decode(response.body)['info'];
      case 500:
        throw json.decode(response.body)['info'];
      default:
        throw "Error accourded while communicating with server with status code ${response.statusCode}";
    }
  }

  @override
  Future<ProductModel> getProduct(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$url'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer ${prefs.getString('token')}"
        },
      );
      final ProductModel product =
          ProductModel.fromJson(json.decode(response.body));
      print(response.statusCode);
      print(product.product.length);
      return product;
    } catch (e) {
      throw "Something Error";
    }
  }
}
