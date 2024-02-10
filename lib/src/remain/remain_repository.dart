import 'dart:typed_data';
import 'package:appwrite/models.dart';
import 'package:dio/dio.dart' as PDio;
import 'package:flutter/material.dart';
import 'package:stonepro/src/model/remain.dart';
import 'package:appwrite/appwrite.dart';

class RemainRepository {
  final client = PDio.Dio();
  final url = "http://192.168.100.86:3002";

  Future<List<Remain>> findAll() async {
    client.options.contentType = PDio.Headers.formUrlEncodedContentType;
    final urlRequest = "$url/remains";
    try {
      final response = await client.get(urlRequest);
      List list = response.data as List;
      return list.map((json) => Remain.fromJson(json)).toList();
    } catch (error) {
      debugPrint("Error (Remain Repository) Find All: $error");
      rethrow;
    }
  }

  Future createOne(Remain remain, List<String> imagesIds) async {
    client.options.contentType = PDio.Headers.formUrlEncodedContentType;
    final urlRequest = "$url/remain";

    final data = {
      "description": remain.description,
      "width": remain.width,
      "length": remain.length,
      "stone": remain.stone,
      "responsible": 1,
      "images": imagesIds.length == 1 ? [imagesIds] : imagesIds
    };
    try {
      return await client.post(urlRequest, data: data);
    } catch (error) {
      debugPrint("Error (Remain Repository) Create One: $error");
      rethrow;
    }
  }

  Future<String> uploadFile(Uint8List bytes, String filename) async {
    final client = Client().setEndpoint('https://cloud.appwrite.io/v1').setProject('65c5510c7414d580b656');
    final storage = Storage(client);
    List<String> ids = [];

    try {
      File file = await storage.createFile(
          bucketId: '65c551827ae1ff7092c2',
          fileId: ID.unique(),
          file: InputFile.fromBytes(bytes: bytes, filename: filename));
      return file.$id;
    } catch (err) {
      debugPrint("Error (Remain Repository) Upload File: $err");
      rethrow;
    }
  }
}
