import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
// import 'package:material_ui/material_ui.dart';

import 'summary.dart';

void main() {
  print("Application started");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ArticleView());
  }
}

class ArticleView extends StatefulWidget {
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  // instantiating the view mode here
  final ArticleViewModel viewModel = ArticleViewModel(ArticleModel());

  @override
  void initState() {
    super.initState();
    viewModel.fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wikipedia Flutter")),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return switch ((
            viewModel.isLoading,
            viewModel.summary,
            viewModel.error,
          )) {
            (true, _, _) => const CircularProgressIndicator(),
            (_, _, final Exception e) => Text('Error: $e'),
            (_, final summary?, _) => ArticlePage(
              summary: summary,
              nextArticleCallback: viewModel.fetchArticle,
            ),
            _ => const Text("Something went wrong!"),
          };
        },
      ),
    );
  }
}

class ArticlePage extends StatelessWidget {
  const ArticlePage({
    super.key,
    required this.summary,
    required this.nextArticleCallback,
  });

  final Summary summary;
  final VoidCallback nextArticleCallback;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ArticleWidget(summary: summary),
          ElevatedButton(
            onPressed: nextArticleCallback,
            child: const Text("Next random article"),
          ),
        ],
      ),
    );
  }
}

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.summary});

  final Summary summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 10,
        children: [
          if (summary.hasImage) Image.network(summary.originalImage!.source),
          Text(
            summary.titles.normalized,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          if (summary.description != null)
            Text(
              summary.description!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],
      ),
    );
  }
}

class ArticleModel {
  // adding a normal method for fetching random wikipedia article
  Future<Summary> getRandomArticleSummary() async {
    final uri = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/random/summary',
    );

    final response = await get(uri);

    // added error handling for the response
    if (response.statusCode != 200) {
      throw const HttpException('Failed to update resource');
    }

    // added JSON parsing and returned summary.
    return Summary.fromJson(jsonDecode(response.body) as Map<String, Object?>);
  }
}

// created article view model class which contains summary, error, and loading state.
class ArticleViewModel extends ChangeNotifier {
  final ArticleModel model;
  Summary? summary;
  Exception? error;
  bool isLoading = false;

  // updated constructor to automatically fetch content when the ArticleViewModel is created.
  ArticleViewModel(this.model) {
    fetchArticle();
  }

  // added methods
  Future<void> fetchArticle() async {
    isLoading = true;
    notifyListeners();
    try {
      summary = await model.getRandomArticleSummary();
      print('Article loaded: ${summary!.titles.normalized}'); // Temporary
      error = null; // Clear any previous errors.
    } on HttpException catch (e) {
      print('Error loading article: ${e.message}'); // Temporary
      error = e;
      summary = null;
    }
    isLoading = false;

    notifyListeners();
  }
}
