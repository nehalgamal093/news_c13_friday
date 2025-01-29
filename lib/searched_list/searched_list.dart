import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../news_item.dart';
import '../provider/news_searched_list_provider.dart';

class SearchedList extends StatelessWidget {
  const SearchedList({super.key});

  @override
  Widget build(BuildContext context) {
    NewsSearchedListProvider newsSearchedListProvider = Provider.of<NewsSearchedListProvider>(context);
    if(newsSearchedListProvider.isLoading){
      return CircularProgressIndicator();
    }
    if(newsSearchedListProvider.articles.isEmpty){
      return Expanded(
        child: Center(
          child: Text(
            newsSearchedListProvider.searchedItem.isEmpty
                ? 'Start typing to search'
                : 'No results found',
          ),
        ),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemCount: newsSearchedListProvider.articles.length,
        itemBuilder: (context, index) {
          return NewsItem(
              article: newsSearchedListProvider.articles[index]);
        },
        separatorBuilder: (context, index) =>
        const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
