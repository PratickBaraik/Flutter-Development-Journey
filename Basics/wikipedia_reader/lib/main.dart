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
    print("MainApp build executed");
    // Instantiate your `ArticleViewModel` to test its HTTP requests.
    final viewModel = ArticleViewModel(ArticleModel());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Wikipedia Flutter')),
        body: const Center(child: Text('Check console for article data')),
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
