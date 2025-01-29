import 'package:flutter/material.dart';
import 'package:news_c13_friday/home_screen.dart';
import 'package:news_c13_friday/provider/news_searched_list_provider.dart';
import 'package:news_c13_friday/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsSearchedListProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SearchScreen.routName: (context) => const SearchScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
