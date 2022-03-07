import 'package:flutter/material.dart';
import 'package:bookui/src/settings/settings_controller.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/google_book.dart';

class SearchNavig extends StatefulWidget {
  final SettingsController controller;

  const SearchNavig({Key? key, required this.controller}) : super(key: key);

  @override
  _SearchNavigState createState() => _SearchNavigState();
}

class _SearchNavigState extends State<SearchNavig> with ChangeNotifier {
  List<GoogleBookModel> books = [];
  int page = 0;
  bool isLoading = true;
  String? query = "flutter";
  late TextEditingController _controller;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getBooks();
      }
    });
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.0),
            // SearchBar
            Row(
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
                      widget.controller.updateThemeMode(
                          widget.controller.themeMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light);
                    },
                    icon: Icon(
                      widget.controller.themeMode == ThemeMode.light
                          ? Icons.dark_mode_rounded
                          : Icons.light_mode_rounded,
                    ))
              ],
            ),
            // Results
            Expanded(
                child: Stack(children: [
              Container(
                child: ListView.separated(
                  padding: const EdgeInsets.all(20),
                  primary: false,
                  shrinkWrap: true,
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: books.length,
                  itemBuilder: (_, index) {
                    final book = books[index];
                    return GestureDetector(
                        onTap: () {},
                        child: BookWidget(book.title, book.author,
                            book.subtitle, book.thumbnail, book.description));
                  },
                  separatorBuilder: (_, index) => const SizedBox(
                    height: 20,
                  ),
                ),
              ),
            ]))
          ],
        ));
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

class BookWidget extends StatelessWidget {
  final String? _title, _author, _subtitle, _thumbnail, _description;

  BookWidget(this._title, this._author, this._subtitle, this._thumbnail,
      this._description);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(_thumbnail ?? "-",
                 width: 80, height: 150, fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          _title ?? "-",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.orange[300],
                      )
                    ]),
                Text(
                  _author ?? "-",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        text: _description ?? "-"),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    _buildIconText(Icons.star, Colors.orange[300]!, '4.5(99k)'),
                    const SizedBox(
                      width: 10,
                    ),
                    _buildIconText(
                      Icons.visibility,
                      Colors.white,
                      '65M Read',
                    ),
                  ],
                )
              ]))
        ]));
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 14,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
