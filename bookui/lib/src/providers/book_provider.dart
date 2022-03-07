import 'dart:convert';

import 'package:bookui/src/model/google_book.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {

  List<GoogleBookModel> books = [];
  List<String> favoritesId = [];

  int page = 0;
  bool isLoading = true;
  String? query = "flutter";

  Future<void> getBooks() async {
    try {
      final response = await http.get(Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=$query&startIndex=$page&maxResults=40"));

      //print("response.body ${response.body}");
      final items = jsonDecode(response.body)['items'];
      List<GoogleBookModel> bookList = [];
      for (var item in items) {
        bookList.add(GoogleBookModel.fromApi(item));
      }

      books.addAll(bookList);
      page += 40;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print("error get books $e");
    }
  }



  void onFavorite(String id) {
    if(favoritesId.where((fav) => fav == id).isNotEmpty) {
      favoritesId.remove(id);
    } else {
      favoritesId.add(id);
    }

    notifyListeners();
  }

  bool isFavorite(String id) {
    if(favoritesId.where((fav) => fav == id).isNotEmpty) {
      return true;
    }
    return false;
  }


  void showLoading() {
    isLoading = true;
    notifyListeners();
  }
}