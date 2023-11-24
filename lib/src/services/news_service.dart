import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/src/models/category_model.dart';
import 'package:new_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URLNEWS = Uri.parse('https://newsapi.org/v2');
final _APIKEY = '9d7e86071354437299d97e4848f580ed';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(icon: FontAwesomeIcons.building, name: 'business' ),
    Category(icon: FontAwesomeIcons.tv, name: 'entertainment' ),
    Category(icon: FontAwesomeIcons.addressCard, name: 'general' ),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'health' ),
    Category(icon: FontAwesomeIcons.vials, name: 'science' ),
    Category(icon: FontAwesomeIcons.volleyball, name: 'sports' ),
    Category(icon: FontAwesomeIcons.memory, name: 'technology' ),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    
    for (var item in categories) {
      categoryArticles[item.name] = <Article>[];
     }
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory( String valor ){
    _selectedCategory = valor;
    getArticlesByCategory( valor );
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada {
  return categoryArticles[selectedCategory] ?? []; // Devuelve una lista vacía si es nulo
}

  getTopHeadlines() async {
    final url = Uri.parse('$_URLNEWS/top-headlines?apiKey=$_APIKEY&country=us');
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromRawJson( resp.body );
    headlines.addAll(newsResponse.articles);
    notifyListeners();

  }

  getArticlesByCategory( String category ) async {

    if(categoryArticles[category]!.isNotEmpty){
      return categoryArticles[category];
    }

    final url = Uri.parse('$_URLNEWS/top-headlines?apiKey=$_APIKEY&country=us&category=$category');
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromRawJson( resp.body );
    categoryArticles[category]?.addAll( newsResponse.articles );
    notifyListeners();
  }

}