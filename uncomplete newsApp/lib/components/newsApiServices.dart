import 'package:dio/dio.dart';
import 'package:news_app_mini_hackathon_flutter/components/newsResponse.dart';

class NewsApiServices{
  // String apiKey="";
  String url="https://newsapi.org/v2/everything?q=tesla&from=2021-09-06&sortBy=publishedAt&apiKey=9d92b77ad3da46339185a14972111be0";

  late Dio _dio;

newsApiServices(){
  _dio=Dio();

}

Future<List<Article>> fetchNewsArticle() async{

// try{
Response response=await _dio.get(url);
print("RESPONSE++++++>>>>>>>${response.data}");
NewsResponse newsResponse=NewsResponse.fromJson(response.data);
print("NEWS RESPONSE++++++>>>>>>>${newsResponse}");
return newsResponse.articles;
// }
// on DioError catch(e){
//   print("DIO ERROR=====>${e}");
//   return  Future<List<Article>>.value([{
//     {},
//     "",
//     "",
//     "",
//     "",
//     "",
//     "2021-10-06T15:35:05Z",
//     "",
//   }]);

// }



}



}


