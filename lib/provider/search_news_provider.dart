import 'package:flutter/material.dart';

class SearchNewsProvider extends ChangeNotifier {
  String searchText= "";

  void updateSearchText(String searchText){
    this.searchText = searchText;
    notifyListeners();
  }
}
