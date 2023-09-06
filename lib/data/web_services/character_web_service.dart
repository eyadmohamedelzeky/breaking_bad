import 'package:breaking_bad/constants/strings.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// data from internet
class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
     // connectTimeout: Duration(seconds: 30),
      //receiveTimeout: Duration(seconds: 30),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>?> getAllCharater() async {
    //List<dynamic>
    try {
      Response response = await dio.get('character'); //end point
      return response.data['results'];
    } catch (e) {
      print(e.toString());
    }
    return[];
    
  }
}
