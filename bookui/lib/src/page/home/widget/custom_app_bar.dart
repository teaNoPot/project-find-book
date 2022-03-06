import 'package:bookui/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bookui/src/providers/book_provider.dart';
import 'package:provider/provider.dart';

import '../../../model/google_book.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key, required this.settingsController})
      : super(key: key);
  final SettingsController settingsController;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  List<GoogleBookModel> books = [];
  int page = 0;
  bool isLoading = true;
  String? query = "flutter";
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: Stack(children: <Widget>[
            TextField(
              onChanged: (q) {
                print(q);
                query = q;
              },
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  prefixIcon: IconButton(
                      onPressed: () async {
                        books.clear();
                        await getBooks();
                      },
                      icon: Icon(
                        Icons.search_outlined,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 30,
                      )),
                  hintText: 'Search book here..',
                  hintStyle: TextStyle(color: Colors.grey[600])),
            ),
          ])),
          IconButton(
              onPressed: () {
                widget.settingsController.updateThemeMode(
                    widget.settingsController.themeMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light);
              },
              icon: Icon(
                widget.settingsController.themeMode == ThemeMode.light
                    ? Icons.dark_mode_rounded
                    : Icons.light_mode_rounded,
              ))
        ],
      ),
    );
  }

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

      print(books.length);
      page += 40;
      isLoading = false;
    } catch (e) {
      print("error get books $e");
    }
  }
}
