import 'package:flutter/material.dart';
import 'package:news_c13_friday/api_manager.dart';
import 'package:news_c13_friday/news_item.dart';
import 'package:news_c13_friday/provider/search_news_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static const String routName = '/search_screen';
  final TextEditingController searchedTitleController = TextEditingController();
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchNewsProvider searchNewsProvider =
        Provider.of<SearchNewsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              TextField(
                controller: searchedTitleController,
                onChanged: (val) {
                  searchNewsProvider.updateSearchText(val);
                  ApiManager().getSearchedNews(val);
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
              searchedTitleController.text.isNotEmpty
                  ? FutureBuilder(
                      future: ApiManager()
                          .getSearchedNews(searchNewsProvider.searchText),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("Something went wrong"),
                          );
                        }
                        var data = snapshot.data;
                        if (data!.articles == null) {
                          return const SizedBox();
                        }
                        return Expanded(
                          child: ListView.separated(
                            itemCount: snapshot.data!.articles!.length,
                            itemBuilder: (context, index) {
                              return NewsItem(
                                  article: snapshot.data!.articles![index]);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                          ),
                        );
                      })
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
