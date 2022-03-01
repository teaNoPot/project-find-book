import 'package:flutter/material.dart';

class BookModel {
  final String title;
  final String author;
  final String thumbnailUrl;
  final String description;

  BookModel(
      {required this.title,
        required this.author,
        required this.thumbnailUrl,
        required this.description})
      : assert(title != null);
// assert(description != null);
}