import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_c13_friday/constants.dart';
import 'package:news_c13_friday/model/NewsResponse.dart';
import 'package:news_c13_friday/model/sources_response.dart';

class ApiManager {

  static Future<SourcesResponse> getSources(String categoryName) async {
    Uri url = Uri.https(Constant.BASE_URL, "/v2/top-headlines/sources",
        {"apiKey": Constant.API_KEY, "category": categoryName});
    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);

    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri url = Uri.https(Constant.BASE_URL, "/v2/everything", {
      "apiKey": Constant.API_KEY,
      "sources": sourceId,
    });
    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);

    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

  Future <List<Articles>> getSearchedNews(String searchedText) async {
    List<Articles> articles =[];
    Uri url = Uri.https(Constant.BASE_URL, "/v2/everything",
        {"apiKey": Constant.API_KEY, "q": searchedText});

    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
  if(newsResponse.status == 'ok'){
    articles = newsResponse.articles!;
  }
    return articles;
  }
}
