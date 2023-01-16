import 'package:flutter/material.dart';
import 'package:newsapp/viewmodel/article_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    final vn = Provider.of<ArticlesListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Haberler"),
        ),
        body: ListView.builder(
          itemCount: vn.viewModel.articles.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Image.network(vn.viewModel.articles[index].urlToImage ??
                      'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png'),
                  ListTile(
                    title: Text(
                      vn.viewModel.articles[index].title ??
                          'Haber Yükleniyor...',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(vn.viewModel.articles[index].description ??
                          'Haber Yükleniyor...'),
                    ),
                  ),
                  ButtonBar(
                    children: [
                      MaterialButton(
                        child: Text(
                          "Habere Git",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () async {
                          await launchUrl(Uri.parse(
                              vn.viewModel.articles[index].url ?? ''));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
