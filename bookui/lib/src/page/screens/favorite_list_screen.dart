import 'package:flutter/material.dart';
import 'package:bookui/src/settings/settings_controller.dart';
import 'package:provider/provider.dart';
import 'package:bookui/src/providers/book_provider.dart';

import '../home/widget/book.dart';

class FavoriteNavig extends StatefulWidget {
  final SettingsController controller;

  const FavoriteNavig({Key? key, required this.controller}) : super(key: key);

  @override
  _FavoriteNavigState createState() => _FavoriteNavigState();
}

class _FavoriteNavigState extends State<FavoriteNavig> {
  HomeProvider? _provider;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<HomeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "My Favorite Books",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                )),
            Consumer<HomeProvider>(
                builder: (context, provider, widget) => Expanded(
                        child: Stack(children: [
                      Visibility(
                          visible: provider.favoriteBooks.isNotEmpty,
                          child: Container(
                            child: ListView.separated(
                              padding: const EdgeInsets.all(20),
                              primary: false,
                              shrinkWrap: true,
                              controller: _scrollController,
                              scrollDirection: Axis.vertical,
                              itemCount: provider.favoriteBooks.length,
                              itemBuilder: (_, index) {
                                final book = provider.favoriteBooks[index];

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
                          )),
                      Visibility(
                          visible: provider.favoriteBooks.isEmpty,
                          child: const Center(
                              child: Text("No favorite books selected",
                                  style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none))))
                    ])))
          ],
        ));
  }
}
