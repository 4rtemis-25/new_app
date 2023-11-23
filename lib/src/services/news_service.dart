import 'package:flutter/material.dart';
import 'package:new_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URLNEWS = Uri.parse('https://newsapi.org/v2');
final _APIKEY = '9d7e86071354437299d97e4848f580ed';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.parse('$_URLNEWS/top-headlines?apiKey=$_APIKEY&country=co');
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromRawJson( resp.body );
    headlines.addAll(newsResponse.articles);
    notifyListeners();

  }

}