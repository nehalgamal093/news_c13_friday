import 'package:flutter/material.dart';
import 'package:news_c13_friday/api_manager.dart';
import 'package:news_c13_friday/app_drawer.dart';
import 'package:news_c13_friday/categories_section.dart';
import 'package:news_c13_friday/model/sources_response.dart';
import 'package:news_c13_friday/news_widget.dart';
import 'package:news_c13_friday/search_screen/search_screen.dart';
import 'package:news_c13_friday/tabs_section.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HOmee";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        onBack: onBack,
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: [IconButton(onPressed: () {
          Navigator.pushNamed(context, SearchScreen.routName);
        }, icon: Icon(Icons.search))],
        title: Text(selectedCategory ?? "Home"),
      ),
      // body: TabsSection(),
      body: selectedCategory == null
          ? CategoriesSection(
              onCategoryClick: onCategoryClicked,
            )
          : TabsSection(categoryName: selectedCategory!),
    );
  }

  String? selectedCategory;

  onCategoryClicked(category) {
    selectedCategory = category;
    setState(() {});
  }

  onBack() {
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {});
  }
}
