import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/articles.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/viewmodel/article_view_model.dart';

enum Status { initial, loading, loaded }

class ArticlesListViewModel extends ChangeNotifier {
  ArticleViewModel viewModel = ArticleViewModel('general', []);
  Status status = Status.initial;
  ArticlesListViewModel() {
    getNews();
  }
  Future<void> getNews() async {
    status = Status.loading;
    notifyListeners();
    viewModel.articles = await NewService().fetchNews(viewModel.category);
    status = Status.loaded;
  }
}
