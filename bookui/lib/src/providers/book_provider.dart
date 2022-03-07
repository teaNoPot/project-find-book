import 'dart:convert';

import 'package:bookui/src/model/google_book.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {

  List<GoogleBookModel> books = [];
  List<String> favoritesId = [];
  List<GoogleBookModel> favoriteBooks = [];

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

  Future<GoogleBookModel?> getBookDetail(String? id) async {
    try {
      final response = await http
          .get(Uri.parse("https://www.googleapis.com/books/v1/volumes/$id"));

      //print("url ${response.request?.url}");
      //print("response.body ${jsonDecode(response.body)}");
      return GoogleBookModel.fromApi(jsonDecode(response.body));
    } catch (e) {
      print("error get book detail $e");
      return null;
    }
  }

  bool inFavList(String id) {
    return favoritesId.contains(id);
  }

  void onFavorite(String id) async {

    favoriteBooks = favoriteBooks.where((book) => inFavList(book.id ?? "")).toList();

    if(favoritesId.contains(id)) {
      favoritesId.remove(id);
      favoriteBooks.remove(favoriteBooks.where((book) => book.id == id).first);
    } else {
      favoritesId.add(id);
      GoogleBookModel book = await getBookDetail(id) ?? GoogleBookModel(id: "NULL");
      if(book.id != "NULL") {
        favoriteBooks.add(book);
      }
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