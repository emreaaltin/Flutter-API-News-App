import 'package:flutter/material.dart';
import 'package:newsapp/pages/news_pages.dart';
import 'package:newsapp/viewmodel/article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haberler',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ArticlesListViewModel(),
        child: NewsPage(),
      ),
    );
  }
}
