import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stonepro/src/model/stone.dart';

class HomeRepository {
  final client = Dio();
  final url = "http://192.168.100.86:3002";

  Future<List<Stone>> findAll() async {
    client.options.contentType = Headers.formUrlEncodedContentType;
    final urlRequest = "$url/stones";
    try {
      final response = await client.get(urlRequest);
      List list = response.data as List;
      return list.map((json) => Stone.fromJson(json)).toList();
    } catch (error) {
      debugPrint("Error (Home Repository) Find All: $error");
      rethrow;
    }
  }
}
