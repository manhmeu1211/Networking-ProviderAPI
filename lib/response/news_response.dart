import '../networking/api_provider.dart';
import 'dart:async';
import '../models/news_model.dart';
import 'dart:convert';

class NewsRepository {

  ApiProvider _provider = ApiProvider(queryParameters: {
    'pageIndex': '1',
    'pageSize': '2',
  });

  NewsResponse parseProducts(String responseBody) {
    final parsed = jsonDecode(responseBody);
    var news = NewsResponse.fromJson(parsed);
    for (int i = 0; i < news.response.news.length; i++) {
      print(news.response.news[i].title);
    }
    return news;
  }

  Future<NewsResponse> fetchProducts() async {
    final responseBody = await _provider.get("api/v0/listNews");
    return parseProducts(responseBody);
  }
}



