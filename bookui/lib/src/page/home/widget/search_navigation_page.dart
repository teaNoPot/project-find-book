import 'package:flutter/material.dart';
import 'package:bookui/src/settings/settings_controller.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bookui/src/model/google_book.dart';
import 'package:bookui/src/providers/book_provider.dart';

import 'favorite.dart';

class SearchNavig extends StatefulWidget {
  final SettingsController controller;

  const SearchNavig({Key? key, required this.controller}) : super(key: key);

  @override
  _SearchNavigState createState() => _SearchNavigState();
}

class _SearchNavigState extends State<SearchNavig> {
  HomeProvider? _provider;

  // Controllers
  late TextEditingController _controller;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _provider = Provider.of<HomeProvider>(context, listen: false);
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
                Consumer<HomeProvider>(
                    builder: (context, provider, widget) => Expanded(
                            child: Stack(children: <Widget>[
                          TextField(
                            onChanged: (q) {
                              _provider?.query = q;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      _search();
                                    },
                                    icon: Icon(
                                      Icons.search_outlined,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      size: 30,
                                    )),
                                hintText: 'Search book here..',
                                hintStyle: TextStyle(color: Colors.grey[600])),
                          ),
                        ]))),
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
            Consumer<HomeProvider>(
                builder: (context, provider, widget) => Expanded(
                        child: Stack(children: [
                      Container(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(20),
                          primary: false,
                          shrinkWrap: true,
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          itemCount: provider.books.length,
                          itemBuilder: (_, index) {
                            final book = provider.books[index];

                            return GestureDetector(
                                onTap: () {},
                                child: BookWidget(
                                    book.id,
                                    book.title,
                                    book.author,
                                    book.subtitle,
                                    book.thumbnail,
                                    book.description));
                          },
                          separatorBuilder: (_, index) => const SizedBox(
                            height: 20,
                          ),
                        ),
                      ),
                      provider.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : SizedBox(),
                    ])))
          ],
        ));
  }

  void _search() {
    _provider?.books.clear();
    _provider?.showLoading();
    _provider?.getBooks();
  }
}

class BookWidget extends StatelessWidget {
  final String? _id, _title, _author, _subtitle, _thumbnail, _description;
  BookWidget(this._id, this._title, this._author, this._subtitle,
      this._thumbnail, this._description);

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
                      FavoriteWidget(favoriteId: _id ?? "-")
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


