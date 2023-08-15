//'https://newsdata.io/api/1/news?apikey=pub_163057ae0fa186a1ef7d062d07c8cc0f49944&q=news&country=eg&language=ar&category=business '),
import 'package:dio/dio.dart';

class DioHelper{

  static Dio? dio;

// https://newsdata.io/api/
  static init(){

    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsdata.io/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type' : 'application/json'
          }
      ),
    );

  }

  static  Future<Response> getData({

    required url,
    Map<String, dynamic>? Quiry,
    String lang = 'en',
    String? authorization,
  }) async {
    dio!.options.headers = {
      'lang' : lang,
      'Authorization' : authorization??'',
      'Content-Type' : 'application/json'
    };
    return await dio!.get(url,queryParameters: Quiry);


  }}