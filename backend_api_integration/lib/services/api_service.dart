import 'package:dio/dio.dart';

class ApiService{
  static late Dio _client;

  ApiService(){
    if(_client==null){
      _client=Dio(
       BaseOptions(
         baseUrl:"localhost"
       )
      );
    }
  }

Future<dynamic> methodName() async {
  var response= await _client.get('');
  return response.data;
}


}