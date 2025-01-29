import 'package:flutter/cupertino.dart';
import 'package:news_c13_friday/api_manager.dart';
import 'package:news_c13_friday/debounce/debouncer.dart';
import 'package:news_c13_friday/model/NewsResponse.dart';

class NewsSearchedListProvider extends ChangeNotifier {
  final ApiManager _apiManager = ApiManager();
  final Debouncer debouncer =
      Debouncer(delay: const Duration(milliseconds: 600));
  List<Articles> _articles = [];
  String _searchedItem = '';
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<Articles> get articles => _articles;
  String get searchedItem =>_searchedItem;

  void setQuery(String searchedItem) {
    _searchedItem = searchedItem;
    debouncer.call(() {
      if (searchedItem.isNotEmpty) {
        search();
      } else {
        _articles.clear();
        notifyListeners();
      }
    });
  }

  Future<void> search() async {
    _isLoading = true;
    notifyListeners();
    try {
      final results = await _apiManager.getSearchedNews(_searchedItem);
      _articles = results;
    } catch (e) {
      _articles.clear();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
