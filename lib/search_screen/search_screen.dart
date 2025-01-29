import 'package:flutter/material.dart';
import 'package:news_c13_friday/api_manager.dart';
import 'package:news_c13_friday/news_item.dart';
import 'package:news_c13_friday/provider/news_searched_list_provider.dart';
import 'package:news_c13_friday/searched_list/searched_list.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static const String routName = '/search_screen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsSearchedListProvider newsSearchedListProvider = Provider.of<NewsSearchedListProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              TextField(
                onChanged: (val) {
                  newsSearchedListProvider.setQuery(val);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // /"WATCH: Tiny dog makes big mark running marathons"
         SearchedList()
            ],
          ),
        ),
      ),
    );
  }
}
